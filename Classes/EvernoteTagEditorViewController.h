//
//  EvernoteTagEditorViewController.h
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright DeNA Global, Inc. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvernoteTagEditorViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    NSArray* tags;
}

@property (nonatomic, retain) NSArray* tags;

@end

