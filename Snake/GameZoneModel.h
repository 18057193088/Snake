//
//  GameZoneModel.h
//  Snake
//
//  Created by yxy on 15/8/6.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameZoneModel : NSObject
@property(assign,nonatomic) BOOL isGameRunnig;
-(int)mapValue:(int)row col:(int)col;
-(void)resetMap;
-(void)setMapValue:(int)row col:(int)col value:(int)value;
-(void)clearMap:(int)row col:(int)col;

@property(assign,nonatomic)float curSpeed;
@property(assign,nonatomic) int curSpeedLevel;

@end
