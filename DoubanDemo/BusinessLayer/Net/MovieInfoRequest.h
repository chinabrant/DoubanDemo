//
//  MovieInfoRequest.h
//  DoubanDemo
//
//  Created by wusj on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@interface MovieInfoRequest : NSObject <ASIHTTPRequestDelegate>

- (void)startRequestWithId:(NSString *)itemId;

@end
