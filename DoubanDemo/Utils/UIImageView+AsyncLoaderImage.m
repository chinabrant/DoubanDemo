//
//  UIImageView+AsyncLoaderImage.m
//  InCarTimeV3
//
//  Created by wusj on 13-8-29.
//  Copyright (c) 2013年 wangsl-iMac. All rights reserved.
//

#import "UIImageView+AsyncLoaderImage.h"

@implementation UIImageView (AsyncLoaderImage)

- (void)setImageUrl:(NSString *)url {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *responseData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        UIImage *tempImage = [UIImage imageWithData:responseData];
        if (tempImage) {
            dispatch_async(dispatch_get_main_queue(), ^{
                //[cell setPic:tempImage];
                self.image = tempImage;
            });
        }
    });
}

@end
