//
//  MovieRequest.h
//  DoubanDemo
//
//  Created by 吴述军 on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
@class MovieList;

@protocol MovieRequestDelegate <NSObject>

- (void)didFinishedRequestMovie:(MovieList *)list;

@end

@interface MovieRequest : NSObject <ASIHTTPRequestDelegate> {
//    ASIHTTPRequest * http;
}

@property (nonatomic, retain) id <MovieRequestDelegate> delegate;

- (void)startRequestWithStartPosition:(int)start andString:(NSString *)q;

@end
