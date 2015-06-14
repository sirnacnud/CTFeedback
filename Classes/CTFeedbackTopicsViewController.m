//
//  CTFeedbackTopicsViewController.m
//  CTFeedbackDemo
//
//  Created by 和泉田 領一 on 2013/11/01.
//  Copyright (c) 2013年 CAPH. All rights reserved.
//

#import "CTFeedbackTopicsViewController.h"
#import "NSBundle+CTFeedback.h"

static NSString *CTFeedbackTopicsViewControllerCellIdentifier = @"Cell";

@interface CTFeedbackTopicsViewController ()

@property (nonatomic,strong) NSIndexPath* selected;

@end

@implementation CTFeedbackTopicsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = CTFBLocalizedString(@"Topic");

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CTFeedbackTopicsViewControllerCellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSString *topic = self.localizedTopics[(NSUInteger)indexPath.row];
    cell.textLabel.text = topic;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor blackColor];
    
    if ([self.selectedTopic isEqualToString:topic]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.selected = indexPath;
    }
    
    UIColor* selectedColor = [UIColor colorWithRed:60.0f/255 green:60.0f/255 blue:60.0f/255 alpha:1];
    
    UIView * selectedBackgroundView = [[UIView alloc] init];
    [selectedBackgroundView setBackgroundColor:selectedColor];
    [cell setSelectedBackgroundView:selectedBackgroundView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CTFeedbackTopicsViewControllerCellIdentifier forIndexPath:indexPath];

    [self configureCell:cell atIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NSString *selectedTopic = self.topics[(NSUInteger)indexPath.row];
    if (self.action) self.action(selectedTopic);
    
    if (![self.selected isEqual:indexPath]) {
        UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:self.selected];
        cell.accessoryType = UITableViewCellAccessoryNone;
    
        self.selected = indexPath;
        cell = [self.tableView cellForRowAtIndexPath:self.selected];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

@end
