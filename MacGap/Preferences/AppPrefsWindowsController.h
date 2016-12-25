#import "DBPrefsWindowController.h"

@interface AppPrefsWindowsController : DBPrefsWindowController <NSWindowDelegate> {
    
    IBOutlet NSView *generalPreferenceView;
    IBOutlet NSView *bandwidthPreferenceView;
    IBOutlet NSView *proxyPreferenceView;
}

@end
