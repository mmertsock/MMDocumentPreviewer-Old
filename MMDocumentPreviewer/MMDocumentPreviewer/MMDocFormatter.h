//
//  MMDocFormatter.h
//  MMDocumentPreviewer
//
//  Created by Mike Mertsock on 1/25/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MMDocFormatter <NSObject>

@property (readonly) NSString *formatterName;

- (NSAttributedString *)attributedStringForString:(NSString *)string;

@end
