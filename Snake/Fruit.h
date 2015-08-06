//
//  Fruit.h
//  Snake
//
//  Created by yxy on 15/8/6.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  RowCol;


@interface Fruit : UIView
@property(strong,nonatomic)UIImageView * imaView;
@property(assign,nonatomic) int type;
@property(strong,nonatomic) RowCol * rowcol;

@end
