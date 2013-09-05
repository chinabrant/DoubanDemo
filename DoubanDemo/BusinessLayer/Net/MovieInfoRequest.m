//
//  MovieInfoRequest.m
//  DoubanDemo
//
//  Created by wusj on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "MovieInfoRequest.h"

@implementation MovieInfoRequest

- (void)startRequestWithId:(NSString *)itemId {
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", API_HEAD, MOVIE_ITEM_INFO, itemId];
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    ASIHTTPRequest *http = [ASIHTTPRequest requestWithURL:url];
    http.delegate = self;
    [http startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    NSLog(@"back : %@", [request responseString]);
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSLog(@"failed");
}

@end
