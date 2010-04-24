//
//  EvernoteAPI+Tag.m
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright 2010 DeNA Global, Inc. All rights reserved.
//

#import "EvernoteAPI+Tag.h"
#import "NoteStore.h"

@implementation EvernoteAPI (Tag)

- (NSArray*)getTags
{
    return [noteStore listTags:authToken];
}

- (void)createTag:(NSString*)tagName
{
    EDAMTag* tag = [[EDAMTag alloc] initWithGuid:nil name:tagName parentGuid:nil updateSequenceNum:0];
    [noteStore createTag:authToken :tag];
    [tag release];
}

- (void)deleteTag
{
}

@end
