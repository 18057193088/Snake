//
//  SnakeBodyView.h
//  Snake
//
//  Created by yxy on 15/8/5.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnakeBodyView : UIView
@property(weak,nonatomic) SnakeBodyView * nextBody;
@property(assign,nonatomic) CGPoint lastTimePoint ;
@property(strong,nonatomic) UIImageView * imaView;

@end
