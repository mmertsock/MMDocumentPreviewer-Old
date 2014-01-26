//
//  MMHTMLDirectFormatter.m
//  MMDocumentPreviewer
//
//  Created by Mike Mertsock on 1/25/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import "MMHTMLDirectFormatter.h"
#import "NSString+MMFormatterUtils.h"

@implementation MMHTMLDirectFormatter

- (NSString *)formatterName
{
    return @"HTML Direct";
}

- (NSAttributedString *)attributedStringForString:(NSString *)string error:(NSError *__autoreleasing *)error
{
    return [string attributedStringFromHTMLStringError:error];
}

@end
