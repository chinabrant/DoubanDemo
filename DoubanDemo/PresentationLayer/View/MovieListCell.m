//
//  MovieListCell.m
//  DoubanDemo
//
//  Created by wusj on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "MovieListCell.h"
#import "MovieItem.h"
#import "UIImageView+AsyncLoaderImage.h"

@implementation MovieListCell
@synthesize titleLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)bindData:(MovieItem *)item {
    self.titleLabel.text = item.title;
    self.yearLabel.text = item.year;
    self.ratingAverage.text = [NSString stringWithFormat:@"%.1f", item.ratingAverage];
    self.ratingStars.text = [NSString stringWithFormat:@"%d", item.ratingStars];
    NSLog(@"url : %@", item.imageSmall);
    [self.imageView setImageUrl:item.imageSmall];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [_ratingAverage release];
    [_ratingStars release];
    [_yearLabel release];
    [self.imageView release];
    [self.titleLabel release];
    [super dealloc];
}
@end
