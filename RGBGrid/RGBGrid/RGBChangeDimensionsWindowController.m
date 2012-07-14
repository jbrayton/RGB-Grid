//
//  RGBChangeDimensionsWindowController.m
//  RGBGrid
//
//  Created by John Brayton on 7/13/12.
//

#import "RGBChangeDimensionsWindowController.h"
#import "RGBAppDelegate.h"

@interface RGBChangeDimensionsWindowController ()

@end

@implementation RGBChangeDimensionsWindowController

- (id)init {

    if (![super initWithWindowNibName:@"RGBChangeDimensionsWindow"]) {
        return nil;
    }
    return self;
}

- (void) awakeFromNib {
    RGBAppDelegate* appDelegate = (RGBAppDelegate*) [NSApp delegate];
    [rowsField setIntValue:[appDelegate numRows]];
    [columnsField setIntValue:[appDelegate numColumns]];
}
    
- (IBAction) handleCancel:(id) sender {
    [self close];
}

- (IBAction) handleChange:(id) sender {
    NSInteger newRows = [rowsField intValue];
    NSInteger newColumns = [columnsField intValue];
    if ((newRows > 0) && (newColumns > 0)) {
        RGBAppDelegate* appDelegate = (RGBAppDelegate*) [NSApp delegate];
        [appDelegate setNumRows:newRows columns:newColumns];
        [self close];
    }
}



@end
