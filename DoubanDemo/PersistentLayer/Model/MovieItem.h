//
//  MovieItem.h
//  DoubanDemo
//
//  Created by 吴述军 on 13-9-5.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 id	 条目id	str
 title	 中文名	 str
 original_title	 原名	 str
 alt	 条目URL	 float(1)	str
 images	 电影海报图，分别提供288px x 465px(大)，96px x 155px(中) 64px x 103px(小)尺寸	 dict	
 rating	 评分，见附录	 dict	
 pubdates	 如果条目类型是电影则为上映日期，如果是电视剧则为首播日期	 array	
 year	 年代	 str	
 subtype	 条目分类, movie或者tv
 */


/*
 {
 "rating": {
 "max": 10,
 "average": 7.6,
 "stars": "40",
 "min": 0
 },
 "title": "人再囧途之泰囧",
 "collect_count": 369875,
 "original_title": "人再囧途之泰囧",
 "subtype": "movie",
 "year": "2012",
 "images": {
 "small": "http://img3.douban.com/spic/s19836660.jpg",
 "large": "http://img3.douban.com/lpic/s19836660.jpg",
 "medium": "http://img3.douban.com/mpic/s19836660.jpg"
 },
 "alt": "http://movie.douban.com/subject/10574622/",
 "id": "10574622"
 }
 
 */

@interface MovieItem : NSObject

@property (nonatomic, copy) NSString * id_;                 // 条目id
@property (nonatomic, copy) NSString * title;               // 中文名
@property (nonatomic, copy) NSString * originalTitle;       // 原名
@property (nonatomic, copy) NSString * alt;
@property (nonatomic, copy) NSString * images;              // 海报
@property (nonatomic, copy) NSString * rating;              // 评分
@property (nonatomic, copy) NSString * pubdates;        // 上映日期
@property (nonatomic, copy) NSString * year;                // year
@property (nonatomic, copy) NSString * subtype;          // 条目分类 movie or tv

@end
