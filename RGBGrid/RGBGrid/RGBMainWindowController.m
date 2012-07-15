//
//  RGBMainWindowController.m
//  RGBGrid
//
//  Created by John Brayton on 7/13/12.
//

#import "RGBMainWindowController.h"
#import "RGBGridView.h"

@interface RGBMainWindowController ()

@end

@implementation RGBMainWindowController

- (id)init {
    if (![super initWithWindowNibName:@"RGBMainWindow"]) {
        return nil;
    }
    return self;
}

- (void) awakeFromNib {
    [[self window] center];
    [[self window] setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];
}

- (void) setNumRows:(NSInteger) argNumRows columns:(NSInteger) argNumColumns {
    [gridView setNumRows:argNumRows columns:argNumColumns];
}

@end
