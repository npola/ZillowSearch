//
//  FacebookShare.h
//  Homework9
//
//  Created by Arjun Pola on 21/11/14.
//  Copyright (c) 2014 Arjun Pola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>
#import "UIView+Toast.h"

@interface FacebookShare : NSObject

@property(nonatomic,retain) NSMutableDictionary *params;
@property(nonatomic,retain) NSString * link;
@property(nonatomic,retain) NSString * name;
@property(nonatomic,retain) NSString * caption;
@property(nonatomic,retain) NSString * pictureLink;
@property(nonatomic,retain) NSString * desc;
@property(nonatomic,retain) NSString * postedId;
@property(nonatomic,retain) UIView * view;
@property(nonatomic) int status;

-(int)shareOnFacebook;
-(void)displayToast:(NSString *)sender;
+(void)Activate;

@end
