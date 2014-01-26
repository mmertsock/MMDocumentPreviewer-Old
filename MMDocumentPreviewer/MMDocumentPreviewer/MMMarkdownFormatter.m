//
//  MMMarkdownFormatter.m
//  MMDocumentPreviewer
//
//  Created by Mike Mertsock on 1/25/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import "MMMarkdownFormatter.h"
#import "NSString+MMFormatterUtils.h"
#import <MMMarkdown.h>

@interface MMMarkdownFormatter ()
@end

@implementation MMMarkdownFormatter

- (NSString *)formatterName
{
    return @"MMMarkdown";
}

- (NSAttributedString *)attributedStringForString:(NSString *)string
                                            error:(__autoreleasing NSError **)error
{
    NSString *HTML = [MMMarkdown HTMLStringWithMarkdown:string error:error];
    if (error && *error) return nil;
    return [[HTML stringWithDefaultHTMLWrappers] attributedStringFromHTMLStringError:error];
}

@end
