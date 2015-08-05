//
//  SnakeBodyView.m
//  Snake
//
//  Created by yxy on 15/8/5.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import "SnakeBodyView.h"
#import "UIColor+GameColor.h"
@implementation SnakeBodyView

-(id)initWithFrame:(CGRect)frame{

    self=[super initWithFrame:frame];
    if(self){
    
        [self setUp];
        
    }
    return self;
    
}


-(void)setUp{

    self.backgroundColor = [UIColor happyPink];
    
}
@end
