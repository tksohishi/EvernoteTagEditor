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

#import "NoteStore.h"

@implementation EvernoteTagEditorViewController

@synthesize tags;

- (void)viewDidLoad {
    [super viewDidLoad];
    EvernoteAPI* api = [EvernoteAPI sharedEvernoteAPI];
    [api authenticateWithId:@"starsky5" withPassword:@"starsky5"];
    self.tags = [api getTags];
}

- (void)viewWillAppear:(BOOL)animated
{
    // left: add button
    
    // right: logout button
    //UINavigationItem* rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [super viewWillAppear:animated];
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
    cell.textLabel.text = [(EDAMTag*)[self.tags objectAtIndex:indexPath.row] name];
    
    return cell;    
}

#pragma mark -
#pragma mark UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}

@end
