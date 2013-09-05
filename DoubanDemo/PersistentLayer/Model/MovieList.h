//
//  MovieList.h
//  DoubanDemo
//
//  Created by 吴述军 on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MovieItem;

@interface MovieList : NSObject

@property (nonatomic, assign) int total;
@property (nonatomic, copy) NSString *queryString;
@property (nonatomic, assign) int start;
@property (nonatomic, retain) NSMutableArray *itemList;

- (void)addMovieItem:(MovieItem *)item;

@end
