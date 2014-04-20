//
//  MySettingsViewController.m
//  MySettings
//
//  Created by Eric Eklund on 4/19/14.
//  Copyright (c) 2014 Eric Eklund. All rights reserved.
//

#import "MySettingsViewController.h"

@interface MySettingsViewController ()

@end

@implementation MySettingsViewController

@synthesize name;
@synthesize event;
@synthesize location;
NSMutableArray *colors;
NSString *favoriteColorSelected;
-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}

-(IBAction) loadSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    name.text = [defaults objectForKey:@"name"];
    event.text = [defaults objectForKey:@"event"];
    
    //---find the index of the array for the color saved---
    favoriteColorSelected = [[NSString alloc] initWithString:
                             [defaults objectForKey:@"location"]];
    int selIndex = [colors indexOfObject:favoriteColorSelected];
    
    //---display the saved color in the Picker view---
    [location selectRow:selIndex inComponent:0 animated:YES];
}

-(IBAction) saveSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:name.text forKey:@"name"];
    [defaults setObject:event.text forKey:@"event"];
    [defaults setObject:location forKey:@"location"];
    [defaults synchronize];
    
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"Settings Value Saved"
                               message:@"Settings Saved"
                              delegate:nil
                     cancelButtonTitle:@"Done"
                     otherButtonTitles:nil];
    [alert show];
    [alert release];
}
- (void)viewDidLoad {
    //---create an array containing the colors values---
    colors = [[NSMutableArray alloc] init];
    
    [colors addObject:@"home"];
    [colors addObject:@"work"];
    [colors addObject:@"other"];
    [super viewDidLoad];
}
//---number of components in the Picker View---
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}
//---number of items(rows) in the Picker View---
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
    return [colors count];
}
//---populating the Picker view---
- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [colors objectAtIndex:row];
}
//---the item selected by the user---
- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    favoriteColorSelected = [colors objectAtIndex:row];
}
- (void)dealloc {
    [colors release];
    [favoriteColorSelected release];
    [name release];
    [event release];
    [location release];
    [super dealloc];
    
}

@end
