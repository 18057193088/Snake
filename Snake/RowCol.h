//
//  RowCol.h
//  Snake
//
//  Created by yxy on 15/8/5.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RowCol : NSObject
@property(assign,nonatomic)  int row;
@property(assign,nonatomic) int col;
-(id)initWithRowCol:(int) row col:(int)col;

@end
