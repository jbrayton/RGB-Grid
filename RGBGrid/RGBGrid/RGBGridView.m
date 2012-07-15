//
//  RGBGridView.m
//  RGBGrid
//
//  Created by John Brayton on 7/13/12.
//

#import "RGBGridView.h"
#import "RGBAppDelegate.h"

@implementation RGBGridView

- (id)initWithFrame:(NSRect)frame
{
    if (![super initWithFrame:frame]) {
        return nil;
    }
    RGBAppDelegate* appDelegate = (RGBAppDelegate*) [NSApp delegate];
    numRows = [appDelegate numRows];
    numColumns = [appDelegate numColumns];
    lastChangedColorIndex = 0;
    
    colors = [NSMutableArray arrayWithObjects:[NSColor redColor], [NSColor greenColor] , [NSColor blueColor], [NSColor orangeColor], [NSColor purpleColor], [NSColor blackColor], nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newColor:) name:@"newcolor" object:nil];
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // white background
    NSRect bounds = [self bounds];
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect:bounds];
    
    CGFloat rectWidth = bounds.size.width / numColumns;
    CGFloat rectHeight = bounds.size.height / numRows;
    
    for( NSInteger i = 0; i < numRows; i++ ) {
        for( NSInteger j = 0; j < numColumns ; j++ ) {
            NSInteger colorIndex = (i*numColumns) + j;
            if (colorIndex < [colors count]) {
                NSColor* color = [colors objectAtIndex:colorIndex];
                CGFloat x = j * rectWidth;
                CGFloat y = (numRows-i-1) * rectHeight;
                NSRect rect = NSMakeRect(x, y, rectWidth, rectHeight);
                [color set];
                [NSBezierPath fillRect:rect];
            }
        }
    }
    
    // grid lines around the boxes
    [[NSColor blackColor] set];
    for( NSInteger i = 0; i < numRows - 1; i++ ) {
        NSBezierPath* path = [NSBezierPath bezierPath];
        CGFloat y = (i+1)*bounds.size.height/numRows;
        [path moveToPoint:NSMakePoint(0, y)];
        [path lineToPoint:NSMakePoint(bounds.size.width, y)];
        [path stroke];
    }
    for( NSInteger i = 0; i < numColumns - 1; i++ ) {
        NSBezierPath* path = [NSBezierPath bezierPath];
        CGFloat x = (i+1) * bounds.size.width / numRows;
        [path moveToPoint:NSMakePoint(x, 0)];
        [path lineToPoint:NSMakePoint(x, bounds.size.height)];
        [path stroke];
    }
}

- (void) setNumRows:(NSInteger)argNumRows columns:(NSInteger)argNumColumns {
    numRows = argNumRows;
    numColumns = argNumColumns;
    [self setNeedsDisplay:YES];
}

#pragma mark Notification Handler

- (void) newColor:(NSNotification*) argNotification {
    NSColor* color = [[argNotification userInfo] objectForKey:@"color"];
    NSInteger newColorIndex = lastChangedColorIndex + 1;
    if (newColorIndex >= (numRows * numColumns)) {
        newColorIndex = 0;
    }
    if (newColorIndex >= [colors count]) {
        [colors addObject:color];
    } else {
        [colors replaceObjectAtIndex:newColorIndex withObject:color];
    }
    [self setNeedsDisplay:YES];
    lastChangedColorIndex = newColorIndex;
}

@end
