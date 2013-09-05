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

@synthesize itemList;
@synthesize queryString;
@synthesize start;
@synthesize total;

- (id)init
{
    self = [super init];
    if (self) {
        itemList = [[NSMutableArray alloc] init];
        self.start = 0;
        self.total = 0;
    }
    
    return self;
}

- (void)addMovieItem:(MovieItem *)item {
    if (itemList == nil) {
        itemList = [[NSMutableArray alloc] init];
    }
    
    [itemList addObject:item];
}

- (void)dealloc
{
    [itemList release];
    [super dealloc];
}

@end
