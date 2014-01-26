//
//  MMDetailViewController.h
//  MMDocumentPreviewer
//
//  Created by Mike Mertsock on 1/25/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MMDocFormatter.h"

@interface MMDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id <MMDocFormatter> detailItem;
@property (weak, nonatomic) IBOutlet UITextView *outputTextView;

@end
