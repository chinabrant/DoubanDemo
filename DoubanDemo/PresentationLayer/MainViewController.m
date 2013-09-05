//
//  MainViewController.m
//  DoubanDemo
//
//  Created by 吴述军 on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "MainViewController.h"
#import "MovieItem.h"
#import "MovieListCell.h"
#import "UIImageView+AsyncLoaderImage.h"
#import "MovieInfoRequest.h"
#import "MovieDetailViewController.h"
#import "MovieList.h"
#import "UIImage+JSMessagesView.h"

#define FieldTag 101

@interface MainViewController ()

@end

@implementation MainViewController

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
    self.title = @"Search Movies";
    self.navigationItem.leftBarButtonItem = nil;
    self.view.backgroundColor = [UIColor colorWithRed:233.0f/255.0f green:233.0f/255.0f blue:233.0f/255.0f alpha:1];
    
    UITextField *field = [[[UITextField alloc] initWithFrame:CGRectMake(5, 5, self.view.frame.size.width - 10 - 70, 30)] autorelease];
    field.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    field.tag = FieldTag;
    UIImage *image = [UIImage imageNamed:@"search_bg.png"];
    image = [image renderAtSize:field.frame.size];
    field.text = @"张艺谋";
    field.backgroundColor = [UIColor colorWithPatternImage:image];
    [self.view addSubview:field];
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(self.view.frame.size.width - 70, 5, 60, 30);
    [searchButton setTintColor:[UIColor blackColor]];
    [searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(startSearch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height - 40 - 44) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithRed:233.0f/255.0f green:233.0f/255.0f blue:233.0f/255.0f alpha:1];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    MovieRequest *request = [[MovieRequest alloc] init];
    request.delegate = self;
    [request startRequestWithStartPosition:0 andString:@"张艺谋"];
}

- (void)startSearch {
    UITextField *field = (UITextField *) [self.view viewWithTag:FieldTag];
    NSString *searchString = field.text;
    if (searchString == nil || [searchString isEqualToString:@""]) {
        field.placeholder = @"搜索内容不能为空";
        return;
    }
    
    [self startRequestWithString:searchString];
}

- (void)startRequestWithString:(NSString *)str {
    MovieRequest *request = [[MovieRequest alloc] init];
    request.delegate = self;
    [request startRequestWithStartPosition:0 andString:str];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[movieList itemList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"cell";
    MovieListCell *cell = (MovieListCell*)[tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell  = [[[NSBundle mainBundle] loadNibNamed:@"MovieListCell" owner:self options:nil] lastObject];
    }
    
    // 绑定要显示的数据
    [cell bindData:(MovieItem *) [[movieList itemList] objectAtIndex:indexPath.row]];
    NSLog(@"==================== row : %d", indexPath.row);
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 113;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    MovieInfoRequest *request = [[MovieInfoRequest alloc] init];
//    [request startRequestWithId:((MovieItem *) [[movieList itemList] objectAtIndex:indexPath.row]).id_];
    MovieDetailViewController *detailVC = [[MovieDetailViewController alloc] init];
    detailVC.movieItem = [[movieList itemList] objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - MovieRequestDelegate
- (void)didFinishedRequestMovie:(MovieList *)list {
    NSLog(@"back ===================== > ");
    movieList = [list retain];
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [_tableView release];
    [movieList release];
    [super dealloc];
}

@end
