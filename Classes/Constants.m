//
//  Constants.m
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/24/10.
//  Copyright 2010 DeNA Global, Inc. All rights reserved.
//

#import "Constants.h"

#ifdef SANDBOX
const NSString* kUserStoreURLBase = @"https://sandbox.evernote.com/edam/user";
const NSString* kNoteStoreURLBase = @"http://sandbox.evernote.com/edam/note/";
#else
const NSString* kUserStoreURLBase = @"https://www.evernote.com/edam/user";
const NSString* kNoteStoreURLBase = @"http://www.evernote.com/edam/note/";
#endif

const NSString* kAPIKey = @"starsky5";
const NSString* kAPISecrect = @"85c680de3776cf88";