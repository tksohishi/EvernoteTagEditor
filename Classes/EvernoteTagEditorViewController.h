//
//  EvernoteTagEditorViewController.h
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright DeNA Global, Inc. 2010. All rights reserved.
//

#import "EvernoteAPI.h"

@interface EvernoteTagEditorViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource> {
    EvernoteAPI* api;
    NSArray* tags;
}

@property (nonatomic, retain) NSArray* tags;

- (IBAction)pressedAdd;

@end

