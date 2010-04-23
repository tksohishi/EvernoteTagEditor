//
//  EvernoteAPI.h
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright 2010 DeNA Global, Inc. All rights reserved.
//

#import "THTTPClient.h"
#import "TBinaryProtocol.h"
#import "UserStore.h"
#import "NoteStore.h"

@interface EvernoteAPI : NSObject {
    EDAMUser* user;
    EDAMUserStoreClient* userStore;
    EDAMNoteStoreClient* noteStore;
    NSString* authToken;
    BOOL isAuth;
}

+ (EvernoteAPI*)sharedEvernoteAPI;
- (void)authenticateWithId:(NSString*)_id withPassword:(NSString*)_password;
- (BOOL)isVersionOK;
- (void)storeCredentialWithId:(NSString*)_id withPassword:(NSString*)_password;
- (NSString*)getId;
- (NSString*)getPassword;
- (void)logout;

@end

extern const NSString* userStoreURLBase;
extern const NSString* noteStoreURLBase;
extern const NSString* APIKey;
extern const NSString* APISecrect;
