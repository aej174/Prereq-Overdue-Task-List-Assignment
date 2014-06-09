//
//  AJEditTaskViewController.m
//  Prereq Overdue Class List Assignment
//
//  Created by Allan Jones on 5/16/14.
//  Copyright (c) 2014 Allan Jones. All rights reserved.
//

#import "AJEditTaskViewController.h"


@interface AJEditTaskViewController ()

@end

@implementation AJEditTaskViewController

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
    
    self.taskNameTextField.text = self.task.title;
    self.editTaskTextView.text = self.task.description;
    self.datePicker.date = self.task.date;
    if (self.task.isCompleted == YES) self.taskNameTextField.backgroundColor = [UIColor greenColor];
    
    //set the delegate properties for UITextView and UITextField
    self.editTaskTextView.delegate = self;
    self.taskNameTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// When the user presses the saveBarButtonItem call the helper method updateTask. Then call the delegate method didUpdateTask defined in the CCDetailViewController.m file
- (IBAction)saveBarButtonPressed:(UIBarButtonItem *)sender
{
    [self updateTask];
    [self.delegate didUpdateTask];
}

- (IBAction)completedTaskButtonPressed:(UIButton *)sender
{
    if (self.task.isCompleted == NO)
    {
        self.task.isCompleted = YES;
        self.taskNameTextField.backgroundColor = [UIColor greenColor];
    }
}

//Helper method that updates the task object to reflect the changes in the EditTaskViewController
- (void)updateTask
{
    self.task.title = self.taskNameTextField.text;
    self.task.description = self.editTaskTextView.text;
    self.task.date = self.datePicker.date;
}

#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.taskNameTextField resignFirstResponder];
    return YES;
}

#pragma mark - UITextViewDelegate

//This method is triggered when the user types a new character in the textView.
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    /*  Test if the entered text is a return. If it is we tell textView to dismiss the keyboard and then we stop the textView from entering in additional information as text. */
    if ([text isEqualToString:@"\n"])
    {
        [self.editTaskTextView resignFirstResponder];
        return NO;
    }
    else return YES;
}

@end

