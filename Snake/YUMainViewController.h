//
//  YUMainViewController.h
//  Snake
//
//  Created by yxy on 15/8/5.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SocreView;
@class GameZoneView;

@interface YUMainViewController : UIViewController
@property(strong,nonatomic) SocreView * gameScoreView;
@property(strong,nonatomic) GameZoneView * gameZoneView;

@end
