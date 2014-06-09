//
//  AJViewController.h
//  Prereq Overdue Class List Assignment
//
//  Created by Allan Jones on 5/16/14.
//  Copyright (c) 2014 Allan Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJAddTaskViewController.h"
#import "AJDetailTaskViewController.h"

@interface AJViewController : UIViewController <AJAddTaskViewControllerDelegate, UITableViewDataSource, UITableViewDelegate, AJDetailTaskViewControllerDelegate>

@property (strong,nonatomic) NSMutableArray *taskObjects;
@property (strong,nonatomic) NSMutableArray *addedTaskObjects;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)reorderBarButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)addTaskBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
