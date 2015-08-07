//
//  StartButton.h
//  Snake
//
//  Created by yxy on 15/8/7.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CONST_PUBLIC.h"
@interface StartButton : UIView
@property(strong,nonatomic) UILabel * titleLabel;
@property(strong,nonatomic) UIButton * button ;
@property(strong,nonatomic) none_return_callback touchCallBack;

@end
