//
//  RGBAppDelegate.m
//  RGBGrid
//
//  Created by John Brayton on 7/13/12.
//

#import "RGBAppDelegate.h"
#import "RGBChangeDimensionsWindowController.h"
#import "RGBMainWindowController.h"
#import "RGBColorGenerator.h"

#define USER_DEFAULTS_NUM_ROWS @"numrows"
#define USER_DEFAULTS_NUM_COLUMNS @"numcolumns"

#define INITIAL_NUM_ROWS 4
#define INITIAL_NUM_COLUMNS 6

@implementation RGBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    numRows = [defaults integerForKey:USER_DEFAULTS_NUM_ROWS];
    if (!numRows) {
        numRows = INITIAL_NUM_ROWS;
    }
    numColumns = [defaults integerForKey:USER_DEFAULTS_NUM_COLUMNS];
    if (!numColumns) {
        numColumns = INITIAL_NUM_COLUMNS;
    }
    
    colorGenerator = [[RGBColorGenerator alloc] init];
    changeDimensionsWindowController = nil;
    mainWindowController = [[RGBMainWindowController alloc] init];
    [mainWindowController showWindow:nil];
}

- (IBAction) showNewDimensionsWindow:(id)sender {
    if (!changeDimensionsWindowController) {
        changeDimensionsWindowController = [[RGBChangeDimensionsWindowController alloc] init];
        
    }
    [changeDimensionsWindowController showWindow:nil];
}

// Save the value, and send it to the main window.
- (void) setNumRows:(NSInteger) argNumRows columns:(NSInteger) argNumColumns {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    numRows = argNumRows;
    numColumns = argNumColumns;
    [defaults setInteger:numRows forKey:USER_DEFAULTS_NUM_ROWS];
    [defaults setInteger:numColumns forKey:USER_DEFAULTS_NUM_COLUMNS];
    [mainWindowController setNumRows:numRows columns:numColumns];
}

- (NSInteger) numRows {
    return numRows;
}

- (NSInteger) numColumns {
    return numColumns;
}


@end
