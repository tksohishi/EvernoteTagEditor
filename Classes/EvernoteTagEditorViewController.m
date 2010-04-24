//
//  EvernoteTagEditorViewController.m
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright DeNA Global, Inc. 2010. All rights reserved.
//

#import "EvernoteTagEditorViewController.h"
#import "EvernoteAPI.h"
#import "EvernoteAPI+Tag.h"
#import "CredentialViewController.h"
#import "AddTagViewController.h"

#import "NoteStore.h"

@implementation EvernoteTagEditorViewController

@synthesize tags;

- (void)viewDidLoad {
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    api = [EvernoteAPI sharedEvernoteAPI];
    
    self.navigationItem.title = @"Tag List";
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action:@selector(pressedAdd)] autorelease];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    if (api.isAuth)
    {
        self.tags = [api getTags];
    }
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
    if (!api.isAuth)
    {
        [self presentModalViewController:[[CredentialViewController alloc] initWithNibName:@"CredentialViewController" bundle:nil] animated:YES];
    }

    [super viewDidAppear:animated];
}

- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tags count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [(EDAMTag*)[self.tags objectAtIndex:indexPath.row] name];
    
    return cell;    
}

- (void)setEditing:(BOOL)flag animated:(BOOL)animated
{
    [super setEditing:flag animated:animated];
    
    if (flag == YES){
        
        // ビューを編集可能なビューに切り替える
        
    }
    
    else {
        
        // 必要であれば変更を保存し、ビューを編集不能なビューに切り替える
        
    }
}

#pragma mark -
#pragma mark IB Action
- (IBAction)pressedAdd
{
    [self presentModalViewController:[[AddTagViewController alloc] initWithNibName:@"AddTagViewController" bundle:nil] animated:YES];
}

@end
