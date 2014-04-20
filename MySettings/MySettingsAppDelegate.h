//
//  MySettingsAppDelegate.h
//  MySettings
//
//  Created by Eric Eklund on 4/19/14.
//  Copyright (c) 2014 Eric Eklund. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySettingsAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
