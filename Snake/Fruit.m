//
//  Fruit.m
//  Snake
//
//  Created by yxy on 15/8/6.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import "Fruit.h"
#import "UIColor+GameColor.h"
#import "CONST_FRUITE_TYPE.h"
@implementation Fruit
@synthesize type = _type;

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if(self){
    
        [self setUp];
    }
    
    return self;
    
}
-(void)setType:(int)type{

    
    if(type == FRUIT_NEW_BODY_TYPE){
        [_imaView setImage:[UIImage imageNamed:@"苹果"]];
    
    }
    
    
    if(type == FRUIT_NEW_BODY_SPEED_SLOW_TYPE){
        
         [_imaView setImage:[UIImage imageNamed:@"奇异果"]];
    }
    
    if(type == FRUIT_NEW_BODY_SPEED_UP_TYPE){
    
         [_imaView setImage:[UIImage imageNamed:@"橙子"]];
    	
    }
    if(type == FRUIT_NEW_BODY_RANDOM_ADD_BODY){
    
        [_imaView setImage:[UIImage imageNamed:@"西瓜"]];
        
    }
    if(type == FRUIT_MONSTER){
        [_imaView setImage:[UIImage imageNamed:@"怪物"]];
    }
}
-(void)setUp{
    
   
    _imaView = [[UIImageView alloc]initWithFrame:self.bounds];
    
    [_imaView setImage:[UIImage imageNamed:@"西瓜"]];
    
    [self addSubview:_imaView];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
