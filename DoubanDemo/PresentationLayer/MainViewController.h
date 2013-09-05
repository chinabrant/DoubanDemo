//
//  MainViewController.h
//  DoubanDemo
//
//  Created by 吴述军 on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "BaseViewController.h"
#import "MovieRequest.h"
@class MovieList;

@interface MainViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate, MovieRequestDelegate> {
    UITableView *_tableView;
    MovieList *movieList;
}

@end
