//
//  MMSundownFormatter.m
//  MMDocumentPreviewer
//
//  Created by Mike Mertsock on 1/25/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import "MMSundownFormatter.h"
#import "NSString+MMFormatterUtils.h"
#import <SundownWrapper.h>

@implementation MMSundownFormatter

- (NSString *)formatterName
{
    return @"sundown";
}

- (NSAttributedString *)attributedStringForString:(NSString *)string error:(NSError *__autoreleasing *)error
{
    NSString *HTML = [SundownWrapper convertMarkdownString:string];
    return [HTML attributedStringFromHTMLStringError:error];
}

@end
