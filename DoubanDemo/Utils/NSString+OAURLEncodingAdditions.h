//
//  NSString+OAURLEncodingAdditions.h
//  DoubanDemo
//
//  Created by 吴述军 on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

/*
    对NSString进行utf8编码
 */

#import <Foundation/Foundation.h>

@interface NSString (OAURLEncodingAdditions)

- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;

@end
