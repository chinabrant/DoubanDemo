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

@property (nonatomic, retain) NSMutableArray * list;

- (void)addMovieItem:(MovieItem *)item;

@end
