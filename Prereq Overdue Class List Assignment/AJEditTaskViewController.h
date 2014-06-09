//
//  AJEditTaskViewController.h
//  Prereq Overdue Class List Assignment
//
//  Created by Allan Jones on 5/16/14.
//  Copyright (c) 2014 Allan Jones. All rights reserved.
//
//  AJEditTaskViewController.h

#import <UIKit/UIKit.h>
#import "AJTask.h"


@protocol AJEditTaskViewControllerDelegate <NSObject>

- (void)didUpdateTask;

@end

//conform to the UITextViewDelegate and the UITextFieldDelegate to allow the keyboard to be dismissed.
@interface AJEditTaskViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) AJTask *task;
@property (weak, nonatomic) id <AJEditTaskViewControllerDelegate> delegate;

- (IBAction)saveBarButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)completedTaskButtonPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (strong, nonatomic) IBOutlet UITextView *editTaskTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UILabel *taskLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailsLabel;
@property (strong, nonatomic) IBOutlet UILabel *ifTaskIsCompletedLabel;

@end
