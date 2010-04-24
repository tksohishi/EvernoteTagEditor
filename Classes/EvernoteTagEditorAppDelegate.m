//
//  EvernoteTagEditorAppDelegate.m
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright DeNA Global, Inc. 2010. All rights reserved.
//

#import "EvernoteTagEditorAppDelegate.h"
#import "EvernoteTagEditorViewController.h"

#import "EvernoteAPI.h"

@implementation EvernoteTagEditorAppDelegate

@synthesize window;
@synthesize navigationController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [window addSubview:navigationController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [navigationController release];
    [window release];
    [super dealloc];
}


@end
