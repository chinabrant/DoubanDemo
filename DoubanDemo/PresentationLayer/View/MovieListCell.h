//
//  MovieListCell.h
//  DoubanDemo
//
//  Created by wusj on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieItem;

@interface MovieListCell : UITableViewCell {
    
}

@property (retain, nonatomic) IBOutlet UILabel *ratingAverage;
@property (retain, nonatomic) IBOutlet UILabel *ratingStars;
@property (retain, nonatomic) IBOutlet UILabel *yearLabel;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;

- (void)bindData:(MovieItem *)item;

@end
