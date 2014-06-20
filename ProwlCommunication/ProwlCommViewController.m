//
//  ProwlCommViewController.m
//  ProwlCommunication
//
//  Created by Nicolas on 18/06/2014.
//  Copyright (c) 2014 charvo_a. All rights reserved.
//

#import "ProwlCommViewController.h"
#import "ProwlKit.h"

@interface ProwlCommViewController ()

@end

@implementation ProwlCommViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.keyArray  = [[NSArray alloc]initWithObjects:@"Nicolas Charvoz", @"0", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)button:(id)sender {
    ProwlKit *prowl = [ProwlKit sharedProwl];
    
    if ([self.appName.text isEqualToString:@""] || [self.eventName.text isEqualToString:@""] || [self.message.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur" message:@"Merci de remplir tous les champs" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        NSLog(@"%d", [_myLabel.text intValue]);
        [self showWithProgress:nil];
        BOOL success = [prowl sendMessage:self.message.text
                       forApplication:self.appName.text
                                event:self.eventName.text
                              withURL:nil
                               forKey:self.apiKey.text
                                 priority:[_myLabel.text intValue]];
        if (success)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Succès" message:@"Message envoyé" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
            }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur" message:@"Erreur lors de l'envoi" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        }
    }
}

#pragma mark - Loading Progress

static float progress = 0.0f;

- (IBAction)slider:(id)sender {
    UISlider *slider = (UISlider *)sender;
    slider.minimumValue = -2.0;
    slider.maximumValue = 2.0;
    int val = slider.value;
    self.myLabel.text = [NSString stringWithFormat:@"%d",val];
}

-(IBAction)showWithProgress:(id)sender {
    progress = 0.0f;
    _progress.progress = progress;
    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.5];
}

-(void)increaseProgress {
    progress+=0.1f;
    _progress.progress = progress;
    if(progress <= 1.1f)
    {
        [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.3];
    }
    else
    {
        progress = 0;
        _progress.progress = progress;
        [self nullText];
    }
    
}

- (IBAction)backgroundClick:(id)sender {
    [self.view endEditing:YES];
}

- (void)nullText
{
    self.message.text = nil;
    self.appName.text = nil;
    self.eventName.text = nil;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return 2;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    
    return [self.keyArray objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component{
    
    NSLog(@"Selected Row %ld", (long)row);
    switch(row)
    {
            
        case 0:
            self.apiKey.text = @"3f68f6f5765757374c9a6d58dbedce9847fb77ac";
            break;
        case 1:
            self.apiKey.text = @"NULL";
            break;
    }
    
}

BOOL check = true;

- (IBAction)keyChose:(id)sender {
    
    UIButton *keyChose = (UIButton*)sender;
    if (check == true)
    {
        [_keyPicker setHidden:NO];
        [_myLabel setHidden:YES];
        [_priority setHidden:YES];
        [_imageView setHidden:YES];
        [_progress setHidden:YES];
        [self.slide setHidden:YES];
        [keyChose setTitle:@"Done" forState:UIControlStateNormal];
        check = false;
        return ;
    }
    if (check == false)
    {
        [_keyPicker setHidden:YES];
        [_myLabel setHidden:NO];
        [_priority setHidden:NO];
        [_imageView setHidden:NO];
        [_progress setHidden:NO];
        [self.slide setHidden:NO];
        [keyChose setTitle:@">" forState:UIControlStateNormal];
        check = true;
        return ;
    }
}


@end
