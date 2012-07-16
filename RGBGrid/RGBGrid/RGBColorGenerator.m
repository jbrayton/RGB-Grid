//
//  RGBColorGenerator.m
//  RGBGrid
//
//  Created by John Brayton on 7/13/12.
//

#import "RGBColorGenerator.h"
#import "RGBAppDelegate.h"

@interface RGBColorGenerator ()
- (float) randomFloat;
@end

@implementation RGBColorGenerator

- (id) init {
    srand((unsigned char) time(NULL));
    timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:.1 target:self selector:@selector(randomColors) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    return self;
}

- (void) randomColors {
    RGBAppDelegate* appController = (RGBAppDelegate*) [NSApp delegate];
    NSInteger numColors = [appController numRows] * [appController numColumns];
    NSMutableArray* colors = [NSMutableArray array];
    for(NSInteger i = 0; i < numColors; i++ ) {
        NSColor* color = [NSColor colorWithDeviceRed:[self randomFloat] green:[self randomFloat] blue:[self randomFloat] alpha:1.0];
        [colors addObject:color];
    }
    NSDictionary* userInfo = [NSDictionary dictionaryWithObject:colors forKey:@"colors"];
    NSNotification* not = [NSNotification notificationWithName:@"newcolors" object:self userInfo:userInfo];
    [[NSNotificationCenter defaultCenter] postNotification:not];
}

#pragma mark Private Methods

- (float) randomFloat {
    return (float) rand()/RAND_MAX;
}

@end
