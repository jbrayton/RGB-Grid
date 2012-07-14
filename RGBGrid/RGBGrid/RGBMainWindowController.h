//
//  RGBMainWindowController.h
//  RGBGrid
//
//  Created by John Brayton on 7/13/12.
//

#import <Cocoa/Cocoa.h>
@class RGBGridView;

@interface RGBMainWindowController : NSWindowController {
    IBOutlet RGBGridView* gridView;
}

- (void) setNumRows:(NSInteger) argNumRows columns:(NSInteger) argNumColumns;

@end
