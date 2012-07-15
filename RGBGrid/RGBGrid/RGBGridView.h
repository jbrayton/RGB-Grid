//
//  RGBGridView.h
//  RGBGrid
//
//  Created by John Brayton on 7/13/12.
//
#import <Cocoa/Cocoa.h>

@interface RGBGridView : NSView {
    NSMutableArray* colors;
    NSInteger numRows;
    NSInteger numColumns;
}

- (void) setNumRows:(NSInteger) argNumRows columns:(NSInteger) argNumColumns;

@end
