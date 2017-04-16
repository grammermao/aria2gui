//
//  SBPopViewCotroller.h
//  Aria2GUI
//
//  Created by Nick on 2017/2/5.
//
//

#import <Cocoa/Cocoa.h>
@class Task2;
@class WindowController;


@interface SBPopViewCotroller : NSViewController


@property (retain, nonatomic) WindowController *WindowController;
@property (weak) IBOutlet NSTextField *displayDownloadSpeed;
@property (nonatomic)Task2 *task;


@end
