//
//  EvernoteAPI+Tag.h
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright 2010 DeNA Global, Inc. All rights reserved.
//

#import "EvernoteAPI.h"

@interface EvernoteAPI (Tag)
- (NSArray*)getTags;
- (void)createTag:(NSString*)tagName;
- (void)deleteTag:(EDAMTag*)tag;
@end
