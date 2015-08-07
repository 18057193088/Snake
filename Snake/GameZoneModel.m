//
//  GameZoneModel.m
//  Snake
//
//  Created by yxy on 15/8/6.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import "GameZoneModel.h"
#import "CONST_PUBLIC.h"
int map[99][99];
@implementation GameZoneModel
@synthesize curSpeedLevel = _curSpeedLevel;

-(id)init{

    self = [super init];
    
    if(self){
        [self setUp];
        
    }
    return self;
    
}

-(void)setCurSpeedLevel:(int)curSpeedLevel{

    _curSpeedLevel = curSpeedLevel;
    
    if(_curSpeedLevel ==0 ){
    
    }
    
}

-(void)setUp{
    
    [self resetMap];
    _curSpeed = 0.2;
    _curSpeedLevel = 0;
    
    
}
-(void)resetMap{
    
    
    for(int i =0 ; i< SNAKE_BODY_ROW_COUNT ; i ++){
        for (int j=0; j<SNAKE_BODY_COL_COUNT; j++) {
            map[i][j]=-1;
            
        }
    }
}

-(int)mapValue:(int)row col:(int)col{

    return map[row][col];
    
}
-(void)setMapValue:(int)row col:(int)col value:(int)value{

    map[row][col] = value;
    
}
-(void)clearMap:(int)row col:(int)col{

    map[row][col]=-1;
    
}
@end
