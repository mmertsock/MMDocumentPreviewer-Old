//
//  MMAttributedStringMarkdownParserFormatter.m
//  MMDocumentPreviewer
//
//  Created by Mike Mertsock on 1/25/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import "MMAttributedStringMarkdownParserFormatter.h"
#import <NSAttributedStringMarkdownParser.h>

@interface MMAttributedStringMarkdownParserFormatter ()
@property (readonly, nonatomic) NSAttributedStringMarkdownParser *markdownParser;
@end

@implementation MMAttributedStringMarkdownParserFormatter

@synthesize markdownParser = _markdownParser;

- (NSAttributedStringMarkdownParser *)markdownParser
{
    return _markdownParser ?: (_markdownParser = [NSAttributedStringMarkdownParser new]);
}

- (NSString *)formatterName
{
    return @"NSAttributedStringMarkdownParser";
}

- (NSAttributedString *)attributedStringForString:(NSString *)string
                                            error:(__autoreleasing NSError **)error
{
    return [self.markdownParser attributedStringFromMarkdownString:string];
}

@end
