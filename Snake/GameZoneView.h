//
//  GameZoneView.h
//  Snake
//
//  Created by yxy on 15/8/5.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef  NS_ENUM(NSInteger, Dirction){

DirctionTop ,
DirctionLeft,
DirctionRight,
DirctionBottom
};
@class SnakeBodyView;

@interface GameZoneView : UIView
@property(strong,nonatomic) NSMutableArray * sakeBodyArr ;

@property(assign,nonatomic) Dirction curDirction;
@property(weak,nonatomic) SnakeBodyView * curHeadSnakeBody;

@end
