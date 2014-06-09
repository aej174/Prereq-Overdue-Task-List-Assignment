//
//  AJDetailTaskViewController.m
//  Prereq Overdue Class List Assignment
//
//  Created by Allan Jones on 5/16/14.
//  Copyright (c) 2014 Allan Jones. All rights reserved.
//

#import "AJDetailTaskViewController.h"

@interface AJDetailTaskViewController ()

@end

@implementation AJDetailTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Update the view object with the task object.
    self.taskLabel.text = self.task.title;
    self.detailTextView.text = self.task.description;
    
    // Set the NSDateFormatter to change NSDate in an NSString with year-month-day + hour:minute.
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd 'at' h:mm a"];
    NSString *stringFromDate = [formatter stringFromDate:self.task.date];
    self.dateLabel.text = stringFromDate;
    if (self.task.isCompleted == YES)
    {
        self.taskLabel.backgroundColor = [UIColor greenColor];
    }
    
}

- (IBAction)taskCompletedButtonPressed:(UIButton *)sender
{
    if (self.task.isCompleted == NO)
    {
        self.task.isCompleted = YES;
        self.taskLabel.backgroundColor = [UIColor greenColor];
        [self didUpdateTask];
    }
}

- (IBAction)editBarButtonPressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"toEditTaskViewControllerSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[AJEditTaskViewController class]])
    {
        AJEditTaskViewController *editTaskViewController = segue.destinationViewController;
        editTaskViewController.task = self.task;
        editTaskViewController.delegate = self;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark AJEditTaskViewControllerDelegate
//when the callback occurs, update the view objects with the updated task properties.

- (void)didUpdateTask
{
    self.taskLabel.text = self.task.title;
    self.detailTextView.text = self.task.description;
    if (self.task.isCompleted == YES)
    {
        self.taskLabel.backgroundColor = [UIColor greenColor];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd 'at' h:mm a"];
    NSString *stringFromDate = [formatter stringFromDate:self.task.date];
    self.dateLabel.text = stringFromDate;
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.delegate updateTask];
}

@end
