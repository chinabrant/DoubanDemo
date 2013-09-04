//
//  JsonParser.m
//  DoubanDemo
//
//  Created by 吴述军 on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "JsonParser.h"

@implementation JsonParser

+ (NSDictionary *)parserMovieList:(NSString *)jsonString {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    return result;
}

@end
