//
//  MMMarkdownFormatter.m
//  MMDocumentPreviewer
//
//  Created by Mike Mertsock on 1/25/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import "MMMarkdownFormatter.h"
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
    
    NSData *data = [HTML dataUsingEncoding:NSUTF8StringEncoding];

    id attrString = [[NSAttributedString alloc]
                     initWithData:data
                     options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                               NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                     documentAttributes:nil
                     error:error];
    
    return attrString;
}

@end
