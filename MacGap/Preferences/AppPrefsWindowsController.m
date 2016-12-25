<<<<<<< HEAD
=======
//
//  AppPrefsWindowsController.m
//  fakeThunder
//
//  Created by Martian Z on 13-10-22.
//  Copyright (c) 2013年 MartianZ. All rights reserved.
//
/*
 Copyright (C) 2012-2014 MartianZ
 
 fakeThunder is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 fakeThunder is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
>>>>>>> origin/master
#import "AppPrefsWindowsController.h"


@implementation AppPrefsWindowsController

-(void)setupToolbar {
<<<<<<< HEAD
    [self addView:generalPreferenceView label:NSLocalizedStringFromTable(@"General1",@"Preferences",nil) image:[NSImage imageNamed:@"General"]];
    [self addView:bandwidthPreferenceView label:NSLocalizedStringFromTable(@"Bandwidth1",@"Preferences",nil) image:[NSImage imageNamed:@"Bandwidth"]];
    //[self addView:proxyPreferenceView label:NSLocalizedStringFromTable(@"proxy1",@"Preferences",nil) image:[NSImage imageNamed:@"Proxy"]];
=======
    [self addView:generalPreferenceView label:@"General" image:[NSImage imageNamed:@"General"]];
    //[self addView:bandwidthPreferenceView label:@"Bandwidth" image:[NSImage imageNamed:@"Bandwidth"]];
>>>>>>> origin/master
    
    [self setCrossFade:YES];
	[self setShiftSlowsAnimation:YES];
    
    [[NSColorPanel sharedColorPanel] setShowsAlpha:YES];
    [NSColor setIgnoresAlpha:NO];
}

-(IBAction)selectSavePath:(id)sender
{
    NSPopUpButton *popupButton = (NSPopUpButton *)sender;
    if ([popupButton indexOfSelectedItem] == 2) {
        NSOpenPanel *panel = [NSOpenPanel openPanel];
        [panel setCanChooseFiles:NO];
        [panel setCanChooseDirectories:YES];
        [panel beginSheetModalForWindow:self.window completionHandler:^(NSInteger result) {
            if (result == NSFileHandlingPanelOKButton) {
                NSURL *url = panel.directoryURL;
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:[url path] forKey:Aria2GUI_SAVE_PATH];
                [[popupButton itemAtIndex:0] setTitle:[[url path] lastPathComponent]];
                [[popupButton itemAtIndex:0] setImage:[[NSWorkspace sharedWorkspace] iconForFileType:NSFileTypeForHFSTypeCode(kGenericFolderIcon)]];
                [defaults setObject:[[url path] lastPathComponent] forKey:Aria2GUI_SAVE_PATH_DISPLAY];
                
                [defaults synchronize];
            }
        }];
        
        [popupButton selectItemAtIndex:0];
    }
}

- (IBAction)editAria2GUISH:(id)sender
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"aria2" ofType:@"conf"];
    if ([fileManager fileExistsAtPath:path])
    {
        [[NSWorkspace sharedWorkspace] openFile:path withApplication:@"TextEdit"];
<<<<<<< HEAD
    }
=======
        
    }
    
>>>>>>> origin/master
    else
    {
        NSAlert *alertDefult = [[NSAlert alloc]init];
        [alertDefult setMessageText:@"miss the conf file"];
        [alertDefult setInformativeText:@"miss the conf file"];
        [alertDefult addButtonWithTitle:@"ok!"];
<<<<<<< HEAD
    }
}

- (void)relaunchAfterDelay:(float)seconds
{
    NSTask *task = [[NSTask alloc] init] ;
    NSMutableArray *args = [NSMutableArray array];
    [args addObject:@"-c"];
    [args addObject:[NSString stringWithFormat:@"sleep %f; open \"%@\"", seconds, [[NSBundle mainBundle] bundlePath]]];
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:args];
    [task launch];
    [NSApp terminate:nil];
}

- (IBAction)restartAria2:(id)sender
{
    NSString *restartAriaPath = [[NSBundle mainBundle] pathForResource:@"restartAria2" ofType:@"sh"];
    NSTask *task = [[NSTask alloc] init];
    task.launchPath = @"/bin/sh";
    task.arguments = @[restartAriaPath];
    [task launch];
    [self relaunchAfterDelay:1.0];
}



=======


    }
    
    
}


>>>>>>> origin/master
@end
