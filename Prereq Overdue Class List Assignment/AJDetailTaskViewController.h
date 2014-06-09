//
//  AJDetailTaskViewController.h
//  Prereq Overdue Class List Assignment
//
//  Created by Allan Jones on 5/16/14.
//  Copyright (c) 2014 Allan Jones. All rights reserved.
//
//  AJDetailTaskViewController.h

#import <UIKit/UIKit.h>
#import "AJTask.h"
#import "AJEditTaskViewController.h"

/* A protocol for methods to be implemented by the CCViewController class when the user presses the save button in the CCEditTaskViewController. */
@protocol AJDetailTaskViewControllerDelegate <NSObject>

- (void)updateTask;

@end

/* conform to the AJEditTaskViwControllerDelegate */
@interface AJDetailTaskViewController : UIViewController <AJEditTaskViewControllerDelegate>

@property (strong, nonatomic) AJTask *task;

@property (weak, nonatomic) id <AJDetailTaskViewControllerDelegate> delegate;

- (IBAction)editBarButtonPressed:(UIBarButtonItem *)sender;

@property (strong, nonatomic) IBOutlet UILabel *taskLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UITextView *detailTextView;


@property (strong, nonatomic) IBOutlet UILabel *task1Label;
@property (strong, nonatomic) IBOutlet UILabel *date1Label;
@property (strong, nonatomic) IBOutlet UILabel *taskDetails1Label;
@property (strong, nonatomic) IBOutlet UILabel *ifTaskIsCompletedLabel;

- (IBAction)taskCompletedButtonPressed:(UIButton *)sender;

@end
