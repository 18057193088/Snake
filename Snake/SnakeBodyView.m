//
//  SnakeBodyView.m
//  Snake
//
//  Created by yxy on 15/8/5.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import "SnakeBodyView.h"
#import "UIColor+GameColor.h"
#import "UIView+YUStyle.h"
@implementation SnakeBodyView

-(id)initWithFrame:(CGRect)frame{

    self=[super initWithFrame:frame];
    if(self){
    
        [self setUp];
        
    }
    return self;
    
}


-(void)setUp{
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = [self y_Width] * 0.3;
    self.backgroundColor =[UIColor happyPink];
    self.layer.borderWidth = 0.3;
    self.layer.borderColor =[UIColor whiteColor].CGColor;
    
    _imaView =[[UIImageView alloc]initWithFrame:self.bounds];
    [self addSubview:_imaView];
    
  
    
}
@end
