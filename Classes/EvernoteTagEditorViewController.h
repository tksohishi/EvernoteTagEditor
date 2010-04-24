//
//  EvernoteTagEditorViewController.h
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright DeNA Global, Inc. 2010. All rights reserved.
//

#import "EvernoteAPI.h"

@interface EvernoteTagEditorViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    EvernoteAPI* api;
    NSArray* tags;
    IBOutlet UITableView* tagTableView;
}

@property (nonatomic, retain) NSArray* tags;
@property (nonatomic, retain) IBOutlet UITableView* tagTableView;

- (IBAction)pressedAdd;

@end

