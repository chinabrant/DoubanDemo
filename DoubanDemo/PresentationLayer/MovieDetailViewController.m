//
//  MovieDetailViewController.m
//  DoubanDemo
//
//  Created by wusj on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieItem.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

@synthesize movieItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.movieItem.title;
    
    [self requestDetail];
}

- (void)requestDetail {
    MovieInfoRequest *request = [[MovieInfoRequest alloc] init];
    [request startRequestWithId:self.movieItem.id_];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
