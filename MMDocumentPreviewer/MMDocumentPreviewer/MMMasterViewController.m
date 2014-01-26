//
//  MMMasterViewController.m
//  MMDocumentPreviewer
//
//  Created by Mike Mertsock on 1/25/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import "MMMasterViewController.h"
#import "MMDocFormatter.h"
#import "MMDetailViewController.h"

#import "MMAttributedStringMarkdownParserFormatter.h"
#import "MMMarkdownFormatter.h"
#import "MMSundownFormatter.h"

@interface MMMasterViewController ()
@property NSURL *documentURL;
@property NSArray *formatters;
@end

@implementation MMMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.documentURL = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"md"];
    self.URLtextField.text = self.documentURL.absoluteString;
    self.formatters = @[
                        [MMAttributedStringMarkdownParserFormatter new],
                        [MMMarkdownFormatter new],
                        [MMSundownFormatter new]
                        ];
    self.detailViewController = (MMDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    self.detailViewController.documentURL = self.documentURL;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)URLtextFieldChanged:(id)sender
{
    self.documentURL = [NSURL URLWithString:self.URLtextField.text];
    self.detailViewController.documentURL = self.documentURL;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.formatters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    id <MMDocFormatter> formatter = self.formatters[indexPath.row];
    cell.textLabel.text = formatter.formatterName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        id <MMDocFormatter> object = self.formatters[indexPath.row];
        self.detailViewController.detailItem = object;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        id <MMDocFormatter> object = self.formatters[indexPath.row];
        [[segue destinationViewController] setDocumentURL:self.documentURL];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
