//
//  Comment.h
//  Blocstagram
//
//  Created by Cody Rapp on 10/15/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Comment : NSObject <NSCoding>

@property (nonatomic, strong) NSString *idNumber;

@property (nonatomic, strong) User *from;
@property (nonatomic, strong) NSString *text;

 - (instancetype) initWithDictionary:(NSDictionary *)commentDictionary;

@end
