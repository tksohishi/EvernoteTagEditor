//
//  EvernoteAPI.m
//  EvernoteTagEditor
//
//  Created by Takeshi Ohishi on 4/22/10.
//  Copyright 2010 DeNA Global, Inc. All rights reserved.
//

#import "EvernoteAPI.h"
#import "SynthesizeSingleton.h"
#import "Constants.h"

@implementation EvernoteAPI

SYNTHESIZE_SINGLETON_FOR_CLASS(EvernoteAPI);

@synthesize isAuth;

- (id)init
{
    if (self = [super init])
    {
        // initilize
        NSLog(@"Evernote API initilize");
        // userStore
        NSURL* userStoreURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@", kUserStoreURLBase]];
        THTTPClient* userStoreHTTPClient = [[[THTTPClient alloc] initWithURL:userStoreURL] autorelease];
        TBinaryProtocol* userStoreProtocol = [[[TBinaryProtocol alloc] initWithTransport:userStoreHTTPClient] autorelease];
        userStore = [[EDAMUserStoreClient alloc] initWithProtocol:userStoreProtocol];
        if ([self getId] && ![[self getId] isEqualToString:@""])
        {
            //NSLog(@"id: %@, password: %@", [self getId], [self getPassword]);
            [self authenticateWithId:[self getId] withPassword:[self getPassword]];
        }
    }
    
    return self;
}

- (void)dealloc
{
    [userStore release];
    [noteStore release];
    [user release];
    [authToken release];
    [super dealloc];
}

- (void)authenticateWithId:(NSString*)_id withPassword:(NSString*)_password
{
    if (!isAuth && [[EvernoteAPI sharedEvernoteAPI] isVersionOK])
    {
        @try
        {
            EDAMAuthenticationResult* authResult = [userStore authenticate:_id :_password :[NSString stringWithFormat:@"%@", kAPIKey] :[NSString stringWithFormat:@"%@", kAPISecrect]];
            user = [[authResult user] retain];
            authToken = [[authResult authenticationToken] retain];

            // noteStore
            NSURL* noteStoreURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", kNoteStoreURLBase, [user shardId]]];
            THTTPClient* noteStoreHTTPClient = [[[THTTPClient alloc] initWithURL:noteStoreURL] autorelease];
            TBinaryProtocol* noteStoreProtocol = [[[TBinaryProtocol alloc] initWithTransport:noteStoreHTTPClient] autorelease];
            noteStore = [[EDAMNoteStoreClient alloc] initWithProtocol:noteStoreProtocol];
            isAuth = YES;
        }
        @catch (NSException * e) {
            NSLog(@"Caught %@: %@", [e name], [e reason]);
            isAuth = NO;
        }
    }
}

- (BOOL)isVersionOK
{
    return [userStore checkVersion:@"EDMATest" :[EDAMUserStoreConstants EDAM_VERSION_MAJOR] :[EDAMUserStoreConstants EDAM_VERSION_MINOR]];
}

- (void)storeCredentialWithId:(NSString*)_id withPassword:(NSString*)_password
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:_id forKey:@"id"];
    [userDefaults setObject:_password forKey:@"password"];
}

- (NSString*)getId
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"id"];
}

- (NSString*)getPassword
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"password"];
}

- (void)logout
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"id"];
    [userDefaults removeObjectForKey:@"password"];
}    

@end
