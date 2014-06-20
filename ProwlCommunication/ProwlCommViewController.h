//
//  ProwlCommViewController.h
//  ProwlCommunication
//
//  Created by Nicolas on 18/06/2014.
//  Copyright (c) 2014 charvo_a. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProwlCommViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *appName;
@property (weak, nonatomic) IBOutlet UITextField *eventName;
@property (weak, nonatomic) IBOutlet UITextField *message;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
- (IBAction)slider:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIPickerView *keyPicker;
@property (weak, nonatomic) IBOutlet UILabel *apiKey;
@property (strong, nonatomic) NSArray *keyArray;
@property (weak, nonatomic) IBOutlet UILabel *priority;
- (IBAction)keyChose:(id)sender;

@property (weak, nonatomic) IBOutlet UISlider *slide;
@property (weak, nonatomic) IBOutlet UIButton *send;


- (IBAction)button:(id)sender;
- (IBAction)backgroundClick:(id)sender;
- (IBAction)showWithProgress:(id)sender;
- (void)increaseProgress;
- (void)nullText;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component;
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
@end
