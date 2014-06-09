//
//  AJAddTaskViewController.h
//  Prereq Overdue Class List Assignment
//
//  Created by Allan Jones on 5/16/14.
//  Copyright (c) 2014 Allan Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJTask.h"

@protocol AJAddTaskViewControllerDelegate <NSObject>

@required

-(void)didCancel;
-(void)didAddTask:(AJTask *)task;

@end

@interface AJAddTaskViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) id <AJAddTaskViewControllerDelegate> delegate;

- (IBAction)addTaskButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *addTaskTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UILabel *detailsLabel;

@end
