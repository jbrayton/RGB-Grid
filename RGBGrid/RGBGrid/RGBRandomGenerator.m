//
//  RGBRandomGenerator.m
//  RGBGrid
//
//  Created by John Brayton on 7/13/12.
//

#import "RGBRandomGenerator.h"

@interface RGBRandomGenerator ()
- (float) randomFloat;
@end

@implementation RGBRandomGenerator

- (id) init {
    srand((unsigned char) time(NULL));
    timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:.1 target:self selector:@selector(randomBytes) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    return self;
}

- (void) randomBytes {
    NSColor* color = [NSColor colorWithDeviceRed:[self randomFloat] green:[self randomFloat] blue:[self randomFloat] alpha:1.0];
    NSDictionary* userInfo = [NSDictionary dictionaryWithObject:color forKey:@"color"];
    NSNotification* not = [NSNotification notificationWithName:@"newcolor" object:self userInfo:userInfo];
    [[NSNotificationCenter defaultCenter] postNotification:not];
}

#pragma mark Private Methods

- (float) randomFloat {
    return (float) rand()/RAND_MAX;
}

@end
