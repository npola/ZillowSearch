//
//  FacebookShare.m
//  Homework9
//
//  Created by Arjun Pola on 21/11/14.
//  Copyright (c) 2014 Arjun Pola. All rights reserved.
//

#import "FacebookShare.h"


@implementation FacebookShare

-(int)shareOnFacebook
{
    
    NSLog(@"Name: %@",_name);
    
    _params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
     _name, @"name",
     _caption, @"caption",
     _desc, @"description",
     _link, @"link",
     _pictureLink, @"picture",
     nil];
    
    [FBWebDialogs presentFeedDialogModallyWithSession:nil
                                           parameters:_params
                                              handler:
     ^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
         if (error) {
             // Error launching the dialog or publishing a story.
             NSLog(@"Error publishing story.");
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self.view makeToast:@"Error Publishing Story"];
             });
             
         } else {
             if (result == FBWebDialogResultDialogNotCompleted) {
                 // User clicked the "x" icon
                 NSLog(@"User canceled story publishing.");
                 
                 dispatch_async(dispatch_get_main_queue(), ^{
                     [self.view makeToast:@"Post Cancelled"];
                 });
                 
             } else {
                 // Handle the publish feed callback
                 NSDictionary *urlParams = [self parseURLParams:[resultURL query]];
                 if (![urlParams valueForKey:@"post_id"]) {
                     // User clicked the Cancel button
                     NSLog(@"User canceled story publishing.");
                     
                     dispatch_async(dispatch_get_main_queue(), ^{
                         [self.view makeToast:@"Post Cancelled"];
                     });

                 } else {
                     // User clicked the Share button
                     NSString *msg = [NSString stringWithFormat:
                                      @"Posted Story id: %@",
                                      [urlParams valueForKey:@"post_id"]];
                    
                     //[instance testFunction];
                     
                     NSLog(@"%@", msg);
                     
                     dispatch_async(dispatch_get_main_queue(), ^{
                         [self.view makeToast:msg];
                     });

                 }
             }
         }
     }];

    return _status;
}

+(void)Activate{
    [FBAppEvents activateApp];
}

-(void)displayToast:(NSString *)msg{
    [self.view makeToast:msg];
}

- (NSDictionary*)parseURLParams:(NSString *)query {
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val =
        [kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        params[kv[0]] = val;
    }
    return params;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    // attempt to extract a token from the url
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
}


@end
