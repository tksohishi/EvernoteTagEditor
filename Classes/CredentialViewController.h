//
//  CredentialViewController.h
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright 2010 DeNA Global, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CredentialViewController : UIViewController<UITextFieldDelegate> {
    IBOutlet UITextField* idField;
    IBOutlet UITextField* passwordField;
    IBOutlet UIButton* loginButton;
    IBOutlet UILabel* targetNameLabel;
}

@property (nonatomic, retain) IBOutlet UITextField* idField;
@property (nonatomic, retain) IBOutlet UITextField* passwordField;
@property (nonatomic, retain) IBOutlet UILabel* targetNameLabel;

- (IBAction)pressedLogin;

@end
