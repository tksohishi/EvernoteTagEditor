//
//  AddTagViewController.m
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/24/10.
//  Copyright 2010 DeNA Global, Inc. All rights reserved.
//

#import "AddTagViewController.h"
#import "EvernoteAPI.h"
#import "EvernoteAPI+Tag.h"

@interface AddTagViewController (Internal)
-(void)_addTag;
@end

@implementation AddTagViewController

@synthesize tagNameField;

- (void)dealloc {
    [tagNameField release];
    [super dealloc];
}

- (void)_addTag
{
    if ([tagNameField.text isEqualToString:@""])
        return;

    // Takeshi TODO: should consider duplicate?
    @try
    {
        [[EvernoteAPI sharedEvernoteAPI] createTag:tagNameField.text];
        NSLog(@"add Tag");
    }
    @catch (NSException * e) {
        NSLog(@"Caught %@: %@", [e name], [e reason]);
    }
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self _addTag];
    return YES;
}

- (IBAction)pressedAdd
{
    [self _addTag];
}
- (IBAction)pressedCancel
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
