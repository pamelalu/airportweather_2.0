//
//  AirPortAppDelegate.h
//  AirportWeather
//
//  Created by Pamela Lu-Stone on 2/7/13.
//  Copyright (c) 2013 Pamela Lu-Stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AirPortAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
