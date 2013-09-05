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
#import "MovieList.h"
#import "MovieItem.h"

@implementation MovieRequest

- (id)init
{
    self = [super init];
    if (self) {
//        http = [[ASIHTTPRequest alloc] init];
    }
    
    return self;
}

- (void)startRequestWithStartPosition:(int)start andString:(NSString *)q {
    NSString *urlString = [NSString stringWithFormat:@"https://api.douban.com/v2/movie/search?q=%@&count=%d", q, COUNT];
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    ASIHTTPRequest *http = [ASIHTTPRequest requestWithURL:url];
    http.delegate = self;
    [http startAsynchronous];
}

/*
 "rating": {
 "max": 10,
 "average": 8.1,
 "stars": "40",
 "min": 0
 },
 "title": "张艺谋和他的金陵十三钗",
 "collect_count": 7945,
 "original_title": "张艺谋和他的金陵十三钗",
 "subtype": "tv",
 "year": "2011",
 "images": {
 "small": "http://img3.douban.com/spic/s7020452.jpg",
 "large": "http://img3.douban.com/lpic/s7020452.jpg",
 "medium": "http://img3.douban.com/mpic/s7020452.jpg"
 },
 "alt": "http://movie.douban.com/subject/7065229/",
 "id": "7065229"
 },
 */
#pragma mark - ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request {
    NSDictionary *result = [JsonParser parserMovieList:[request responseString]];
//    NSLog(@"result : %@", result);
    
    NSString * msg = [result valueForKey:@"msg"];
    NSLog(@"msg : %@", msg);
    if (msg == nil) {
        MovieList *list = [[[MovieList alloc] init] autorelease];
        list.start = [[result valueForKey:@"start"] intValue];
        list.total = [[result valueForKey:@"total"] intValue];
        NSArray *array = [result valueForKey:@"subjects"];
        for (int i = 0; i < array.count; i++) {
            NSDictionary *itemDic = [array objectAtIndex:i];
            MovieItem *item = [[MovieItem alloc] init];
            item.id_ = [itemDic valueForKey:@"id"];
            item.title = [itemDic valueForKey:@"title"];
            item.originalTitle = [itemDic valueForKey:@"original_title"];
            item.subtype = [itemDic valueForKey:@"subtype"];
            item.alt = [itemDic valueForKey:@"alt"];
            item.year = [itemDic valueForKey:@"year"];
            item.collectCount = [[itemDic valueForKey:@"collect_count"] intValue];
            item.imageSmall = [[itemDic valueForKey:@"images"] valueForKey:@"small"];
            item.imageMedium = [[itemDic valueForKey:@"images"] valueForKey:@"medium"];
            item.imageLarge = [[itemDic valueForKey:@"images"] valueForKey:@"large"];
            item.ratingMax = [[[itemDic valueForKey:@"rating"] valueForKey:@"max"] intValue];
            item.ratingMin = [[[itemDic valueForKey:@"rating"] valueForKey:@"min"] intValue];
            item.ratingStars = [[[itemDic valueForKey:@"rating"] valueForKey:@"stars"] intValue];
            item.ratingAverage = [[[itemDic valueForKey:@"rating"] valueForKey:@"average"] floatValue];
            [list addMovieItem:item];
            [item release];
        }
        
        // 将解析好的数据通知代理
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFinishedRequestMovie:)]) {
            [self.delegate didFinishedRequestMovie:list];
        }
    }
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
