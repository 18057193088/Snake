//
//  VirtualKeyBoard.h
//  Snake
//
//  Created by yxy on 15/8/7.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VirtualKeyBoardDeledge <NSObject>

-(void)dirctionButtonTouchUpInSide:(int)tag;

@end

@interface VirtualKeyBoard : UIView
@property(strong,nonatomic) NSMutableArray * buttonArray;
@property(strong,nonatomic) UIView * leftBoard;
@property(weak,nonatomic) id<VirtualKeyBoardDeledge>deledge;

@end
