//
//  MovieList.m
//  DoubanDemo
//
//  Created by 吴述军 on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "MovieList.h"
#import "MovieItem.h"

@implementation MovieList

@synthesize list;

- (id)init
{
    self = [super init];
    if (self) {
        list = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addMovieItem:(MovieItem *)item {
    if (list == nil) {
        list = [[NSMutableArray alloc] init];
    }
    
    [list addObject:item];
}

- (void)dealloc
{
    [list release];
    [super dealloc];
}

@end
