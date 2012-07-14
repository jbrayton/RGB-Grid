//
//  RGBAppDelegate.h
//  RGBGrid
//
//  Created by John Brayton on 7/13/12.
//

#import <Cocoa/Cocoa.h>
@class RGBChangeDimensionsWindowController;
@class RGBMainWindowController;
@class RGBRandomGenerator;

@interface RGBAppDelegate : NSObject <NSApplicationDelegate> {
    RGBRandomGenerator* randomGenerator;
    RGBChangeDimensionsWindowController* changeDimensionsWindowController;
    RGBMainWindowController* mainWindowController;
    NSInteger numRows;
    NSInteger numColumns;
}

- (IBAction) showNewDimensionsWindow:(id)sender;

- (void) setNumRows:(NSInteger) argNumRows columns:(NSInteger) argNumColumns;
- (NSInteger) numRows;
- (NSInteger) numColumns;

@end
