//
//  SBPopViewCotroller.m
//  Aria2GUI
//
//  Created by Nick on 2017/2/5.
//
//
#import "SBPopViewCotroller.h"
#import "AppPrefsWindowsController.h"
#import "WindowController.h"



@interface SBPopViewCotroller()
{
    
}

@property (nonatomic)NSArray *downloadSpeed;

@end



@implementation SBPopViewCotroller

- (void)viewDidLoad {

    [super viewDidLoad];
}



- (IBAction)quit:(NSButton *)sender{
    NSArray *arg =[NSArray arrayWithObjects:@"aria2c",nil];
    NSTask *task=[[NSTask alloc] init];
    task.launchPath = @"/usr/bin/killall";
    task.arguments = arg;
    [task launch];
    [NSApp terminate:self];
}

- (IBAction)openPreferences:(NSButton *)sender
{
    [[AppPrefsWindowsController sharedPrefsWindowController] showWindow:nil];
}

- (IBAction)openWindow:(NSButton *)sender
{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    if([currentLanguage  isEqual: @"zh-Hans-CN"])
    {
        self.WindowController = [[WindowController alloc] initWithURL: kStartPage_ZH];
    }
    else
        self.WindowController = [[WindowController alloc] initWithURL: kStartPage];
}
@end
