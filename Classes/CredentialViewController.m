//
//  CredentialViewController.m
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright 2010 DeNA Global, Inc. All rights reserved.
//

#import "CredentialViewController.h"
#import "EvernoteAPI.h"

@implementation CredentialViewController

@synthesize idField, passwordField;

- (void)viewDidLoad
{
    [self.idField becomeFirstResponder];
    [super viewDidLoad];
}

- (IBAction)pressedLogin
{
    NSString* userName = self.idField.text;
    NSString* password = self.passwordField.text;
    
    EvernoteAPI* api = [EvernoteAPI sharedEvernoteAPI];
    [api authenticateWithId:userName withPassword:password];
    if (api.isAuth)
    {
        [api storeCredentialWithId:userName withPassword:password];
        [self dismissModalViewControllerAnimated:YES];
    }
    else {
        UIActionSheet* sheet = [[[UIActionSheet alloc] initWithTitle:@"Login Error" delegate:nil cancelButtonTitle:@"OK" destructiveButtonTitle:nil otherButtonTitles:nil] autorelease];
        [sheet showInView:self.view];
    }

}

- (void)dealloc {
    [idField release];
    [passwordField release];
    [super dealloc];
}


@end
