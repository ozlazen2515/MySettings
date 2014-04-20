//
//  MySettingsViewController.h
//  MySettings
//
//  Created by Eric Eklund on 4/19/14.
//  Copyright (c) 2014 Eric Eklund. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySettingsViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate> {
    IBOutlet UITextField *name;
    IBOutlet UITextField *event;
    IBOutlet UIPickerView *location;
}
@property (nonatomic, retain) UITextField *name;
@property (nonatomic, retain) UITextField *event;
@property (nonatomic, retain) UIPickerView *location;
-(IBAction) loadSettings: (id) sender;
-(IBAction) saveSettings: (id) sender;
-(IBAction) doneEditing: (id) sender;
@end
