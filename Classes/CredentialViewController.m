//
//  CredentialViewController.m
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright 2010 DeNA Global, Inc. All rights reserved.
//

#import "CredentialViewController.h"
#import "EvernoteAPI.h"

@interface CredentialViewController (Internal)
- (void)_login;
@end

@implementation CredentialViewController

@synthesize idField, passwordField;

- (void)viewDidLoad
{
    [self.idField becomeFirstResponder];
    [super viewDidLoad];
}

- (IBAction)pressedLogin
{
    [self _login];
}

- (void)_login
{
    NSString* userName = self.idField.text;
    NSString* password = self.passwordField.text;
    
    EvernoteAPI* api = [EvernoteAPI sharedEvernoteAPI];
    [api authenticateWithId:userName withPassword:password];
    if (api.isAuth)
    {
        NSLog(@"Login Success");
        [api storeCredentialWithId:userName withPassword:password];
        [self dismissModalViewControllerAnimated:YES];
    }
    else {
        UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Login Error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
        [alert show];
    }
}

- (void)dealloc {
    [idField release];
    [passwordField release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == idField) {
		[textField resignFirstResponder];
		[passwordField becomeFirstResponder];
	}
	else if (textField == passwordField) {
		[textField resignFirstResponder];
        [self _login];
    }
    return YES;
}

@end
