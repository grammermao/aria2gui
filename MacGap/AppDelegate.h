//
//  AppDelegate.h
//  MG
//
//  Created by Tim Debo on 5/19/14.
//
//

#import <Cocoa/Cocoa.h>

<<<<<<< HEAD

@class WindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate,NSUserNotificationCenterDelegate>
{

}
=======

@class WindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate,NSUserNotificationCenterDelegate>
>>>>>>> origin/master

@property (retain, nonatomic) WindowController *windowController;

- (IBAction)openPreferences:(id)sender;
- (IBAction)openIssue:(id)sender;






@end
