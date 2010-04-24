//
//  AddTagViewController.h
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/24/10.
//  Copyright 2010 DeNA Global, Inc. All rights reserved.
//

@interface AddTagViewController : UIViewController {
    IBOutlet UITextField* tagNameField;
}

@property (nonatomic, retain) IBOutlet UITextField* tagNameField;

- (IBAction)pressedAdd;
- (IBAction)pressedCancel;

@end
