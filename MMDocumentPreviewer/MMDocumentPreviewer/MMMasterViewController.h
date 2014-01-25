//
//  MMMasterViewController.h
//  MMDocumentPreviewer
//
//  Created by Mike Mertsock on 1/25/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMDetailViewController;

@interface MMMasterViewController : UITableViewController

@property (strong, nonatomic) MMDetailViewController *detailViewController;

@end
