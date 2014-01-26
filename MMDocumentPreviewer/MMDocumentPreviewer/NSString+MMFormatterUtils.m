//
//  NSString+MMFormatterUtils.m
//  MMDocumentPreviewer
//
//  Created by Mike Mertsock on 1/25/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import "NSString+MMFormatterUtils.h"

@implementation NSString (MMFormatterUtils)

- (NSString *)stringWithDefaultHTMLWrappers
{
    NSString *wrap = @"<html><head><style type='text/css'>body { font-family: HelveticaNeue-Light; }</style></head><body>%@</body></html>";
    return [NSString stringWithFormat:wrap, self];
}

- (NSAttributedString *)attributedStringFromHTMLStringError:(NSError *__autoreleasing *)error
{
    NSData *data = [[self stringWithDefaultHTMLWrappers]
                    dataUsingEncoding:NSUTF8StringEncoding];
    
    id attrString = [[NSAttributedString alloc]
                     initWithData:data
                     options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                               NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                     documentAttributes:nil
                     error:error];
    
    return attrString;
}

@end
