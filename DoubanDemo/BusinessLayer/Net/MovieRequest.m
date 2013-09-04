//
//  MovieRequest.m
//  DoubanDemo
//
//  Created by 吴述军 on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "MovieRequest.h"
#import "JsonParser.h"
#import "NSString+OAURLEncodingAdditions.h"

@implementation MovieRequest

- (id)init
{
    self = [super init];
    if (self) {
//        http = [[ASIHTTPRequest alloc] init];
    }
    
    return self;
}

- (void)startRequest {
    NSString *urlString = @"https://api.douban.com/v2/movie/search?q=张艺谋&count=5";
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    ASIHTTPRequest *http = [ASIHTTPRequest requestWithURL:url];
    http.delegate = self;
    [http startAsynchronous];
}

#pragma mark - ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request {
    NSDictionary *result = [JsonParser parserMovieList:[request responseString]];
    NSLog(@"result : %@", result);
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSLog(@"net error: %@", [request error]);
}


- (void)dealloc
{
//    [http release];
    [super dealloc];
}

@end
