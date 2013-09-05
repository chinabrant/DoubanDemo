//
//  MovieDetailViewController.h
//  DoubanDemo
//
//  Created by wusj on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "BaseViewController.h"
#import "MovieInfoRequest.h"
@class MovieItem;

@interface MovieDetailViewController : BaseViewController

@property (nonatomic, retain) MovieItem *movieItem;

@end
