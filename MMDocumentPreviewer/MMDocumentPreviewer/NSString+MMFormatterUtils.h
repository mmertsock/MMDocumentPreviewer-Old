//
//  NSString+MMFormatterUtils.h
//  MMDocumentPreviewer
//
//  Created by Mike Mertsock on 1/25/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MMFormatterUtils)
- (NSString *)stringWithDefaultHTMLWrappers;
- (NSAttributedString *)attributedStringFromHTMLStringError:(__autoreleasing NSError **)error;
@end
