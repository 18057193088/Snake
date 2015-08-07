//
//  YUMainViewController.h
//  Snake
//
//  Created by yxy on 15/8/5.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameZoneView.h"
#import "VirtualKeyBoard.h"
@class SocreView;
@class GameZoneView;
@class StartButton;


@interface YUMainViewController : UIViewController<GameZoneViewDeledge,VirtualKeyBoardDeledge>
@property(strong,nonatomic) SocreView * gameScoreView;
@property(strong,nonatomic) GameZoneView * gameZoneView;
@property(strong,nonatomic) StartButton * startButton ;
@property(strong,nonatomic) VirtualKeyBoard * virtualKeyBoard;

@end
