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

- (IBAction)pressedLogin
{
    NSString* userName = self.idField.text;
    NSString* password = self.passwordField.text;
    
    EvernoteAPI* api = [EvernoteAPI sharedEvernoteAPI];
    [api authenticateWithId:userName withPassword:password];
}

- (void)dealloc {
    [idField release];
    [passwordField release];
    [super dealloc];
}


@end
