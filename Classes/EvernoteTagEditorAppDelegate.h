//
//  EvernoteTagEditorAppDelegate.h
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright DeNA Global, Inc. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EvernoteTagEditorViewController;

@interface EvernoteTagEditorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EvernoteTagEditorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EvernoteTagEditorViewController *viewController;

@end

