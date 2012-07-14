//
//  RGBChangeDimensionsWindowController.h
//  RGBGrid
//
//  Created by John Brayton on 7/13/12.
//

#import <Cocoa/Cocoa.h>

@interface RGBChangeDimensionsWindowController : NSWindowController {
    IBOutlet NSTextField* rowsField;
    IBOutlet NSTextField* columnsField;
}

- (IBAction) handleCancel:(id) sender;
- (IBAction) handleChange:(id) sender;

@end
