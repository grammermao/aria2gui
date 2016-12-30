//
//  AppDelegate.m
//  MG
//
//  Created by Tim Debo on 5/19/14.
//
//

#import "AppDelegate.h"
#import "WindowController.h"
#import "AppPrefsWindowsController.h"


@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification
{
    [self startAria2];
}

-(BOOL)applicationShouldHandleReopen:(NSApplication*)application
                   hasVisibleWindows:(BOOL)visibleWindows{
    if(!visibleWindows){
        [self.windowController.window makeKeyAndOrderFront: nil];
    }
    return YES;
}

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    if([currentLanguage  isEqual: @"zh-Hans-CN"])
    {
        self.windowController = [[WindowController alloc] initWithURL: kStartPage_ZH];
    }
    else
        self.windowController = [[WindowController alloc] initWithURL: kStartPage];
    
    [self.windowController setWindowParams];
    [self.windowController showWindow:self];
    [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];

}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center
     shouldPresentNotification:(NSUserNotification *)notification
{
    return YES;
}

-(void)applicationWillTerminate:(NSNotification *)aNotification
{
    [self closeAria2];
}

-(void)startAria2
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *startAriaPath = [[NSBundle mainBundle] pathForResource:@"startAria2" ofType:@"sh"];
    NSString *dir = [[NSUserDefaults standardUserDefaults] objectForKey:Aria2GUI_SAVE_PATH];
    NSInteger maxConcurrentDownloads = [[NSUserDefaults standardUserDefaults] integerForKey:Aria2GUI_MAX_CONCURRENT_DOWNLOADS];
    NSInteger maxDownloadSpeed = [[NSUserDefaults standardUserDefaults] integerForKey:Aria2GUI_MAX_DOWNLOAD_SPEED];
    NSInteger maxUploadSpeed = [[NSUserDefaults standardUserDefaults] integerForKey:Aria2GUI_MAX_UPLOAD_SPEED];
    NSInteger maxPerDownloadSpeed = [[NSUserDefaults standardUserDefaults] integerForKey:Aria2GUI_MAX_PER_DOWNLOAD_SPEED];
    NSInteger maxPerUploadSpeed = [[NSUserDefaults standardUserDefaults] integerForKey:Aria2GUI_MAX_PER_UPLOAD_SPEED];
    NSString *proxyHost = [[NSUserDefaults standardUserDefaults] objectForKey:Aria2GUI_PROXY_HOST];
    NSInteger proxyPort = [[NSUserDefaults standardUserDefaults] integerForKey:Aria2GUI_PROXY_PORT];
    NSString *proxyUser = [[NSUserDefaults standardUserDefaults] objectForKey:Aria2GUI_PROXY_USER];
    NSString *proxyPassword = [[NSUserDefaults standardUserDefaults] objectForKey:Aria2GUI_PROXY_PASSWORD];
    bool proxyState = [[NSUserDefaults standardUserDefaults] boolForKey:Aria2GUI_PROXY_STATE];
    bool userState = [[NSUserDefaults standardUserDefaults] boolForKey:Aria2GUI_USER_STATE];
    NSString *proxyType = [[NSUserDefaults standardUserDefaults] objectForKey:Aria2GUI_PROXY_TYPE];
    
    if(!proxyState)
    {
        proxyState = NO;
    }
    
    if(!userState)
    {
        userState = NO;
    }
    
    if (!dir || [dir length] == 0)
    {
        dir = [@"~/Downloads" stringByExpandingTildeInPath];
    }
    
    if (maxDownloadSpeed < 0)
    {
        maxDownloadSpeed = 0;
    }
    
    if (maxUploadSpeed < 0)
    {
        maxUploadSpeed = 0;
    }
    
    if (maxPerDownloadSpeed < 0)
    {
        maxPerDownloadSpeed = 0;
    }
    
    if (maxPerUploadSpeed < 0)
    {
        maxPerUploadSpeed = 0;
    }

    if(!maxConcurrentDownloads)
    {
        maxConcurrentDownloads = 10;
    }
    

    NSString *maxDownloadSpeedStr = [NSString stringWithFormat:@"%ldk",maxDownloadSpeed];
    NSString *maxUploadSpeedStr = [NSString stringWithFormat:@"%ldk",maxUploadSpeed];
    NSString *maxPerDownloadSpeedStr = [NSString stringWithFormat:@"%ldk",maxPerDownloadSpeed];
    NSString *maxPerUploadSpeedStr = [NSString stringWithFormat:@"%ldk",maxPerUploadSpeed];



    if (proxyState == YES && userState == YES)
    {
        NSString *shCommand = [NSString stringWithFormat:@"%@ --dir=%@ --conf-path=%@ --input-file=%@ --save-session=%@  --max-concurrent-downloads=%li --max-overall-download-limit=%@ --max-overall-upload-limit=%@ --max-download-limit=%@ --max-upload-limit=%@ --%@-proxy='http://%@:%@@%@:%ld' -D",[[NSBundle mainBundle] pathForResource:@"aria2c" ofType:nil],dir,[[NSBundle mainBundle] pathForResource:@"aria2" ofType:@"conf"],[[NSBundle mainBundle] pathForResource:@"aria2" ofType:@"session"],[[NSBundle mainBundle] pathForResource:@"aria2" ofType:@"session"],(long)maxConcurrentDownloads,maxDownloadSpeedStr,maxUploadSpeedStr,maxPerDownloadSpeedStr,maxPerUploadSpeedStr,proxyType,proxyUser,proxyPassword,proxyHost,(long)proxyPort];
        [shCommand writeToFile:startAriaPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    
    else
        if(proxyState == YES && userState == NO)
    {
        NSString *shCommand = [NSString stringWithFormat:@"%@ --dir=%@ --conf-path=%@ --input-file=%@ --save-session=%@  --max-concurrent-downloads=%li --max-overall-download-limit=%@ --max-overall-upload-limit=%@ --max-download-limit=%@ --max-upload-limit=%@ --%@-proxy='http://%@:%ld' -D",[[NSBundle mainBundle] pathForResource:@"aria2c" ofType:nil],dir,[[NSBundle mainBundle] pathForResource:@"aria2" ofType:@"conf"],[[NSBundle mainBundle] pathForResource:@"aria2" ofType:@"session"],[[NSBundle mainBundle] pathForResource:@"aria2" ofType:@"session"],(long)maxConcurrentDownloads,maxDownloadSpeedStr,maxUploadSpeedStr,maxPerDownloadSpeedStr,maxPerUploadSpeedStr,proxyType,proxyHost,(long)proxyPort];
        [shCommand writeToFile:startAriaPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    
    else
        if ((proxyState == NO && userState == NO) || (proxyState == NO && userState == YES))
    {
        NSString *shCommand = [NSString stringWithFormat:@"%@ --dir=%@ --conf-path=%@ --input-file=%@ --save-session=%@  --max-concurrent-downloads=%li --max-overall-download-limit=%@ --max-overall-upload-limit=%@ --max-download-limit=%@ --max-upload-limit=%@ -D",[[NSBundle mainBundle] pathForResource:@"aria2c" ofType:nil],dir,[[NSBundle mainBundle] pathForResource:@"aria2" ofType:@"conf"],[[NSBundle mainBundle] pathForResource:@"aria2" ofType:@"session"],[[NSBundle mainBundle] pathForResource:@"aria2" ofType:@"session"],(long)maxConcurrentDownloads,maxDownloadSpeedStr,maxUploadSpeedStr,maxPerDownloadSpeedStr,maxPerUploadSpeedStr];
        [shCommand writeToFile:startAriaPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    NSTask *task = [[NSTask alloc] init];
    task.launchPath = @"/bin/sh";
    task.arguments = @[startAriaPath];
    [task launch];
}

-(void)closeAria2
{
    NSArray *arg =[NSArray arrayWithObjects:@"aria2c",nil];
    NSTask *task=[[NSTask alloc] init];
    task.launchPath = @"/usr/bin/killall";
    task.arguments = arg;
    [task launch];
    [NSApp terminate:self];

}

- (IBAction)openPreferences:(id)sender
{
    [[AppPrefsWindowsController sharedPrefsWindowController] showWindow:nil];
}

- (IBAction)openIssue:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"https://github.com/yangshun1029/aria2gui/issues"];
    [[NSWorkspace sharedWorkspace] openURL:url];
}

@end
