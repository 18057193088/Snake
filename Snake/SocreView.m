//
//  GameZoneView.m
//  Snake
//
//  Created by yxy on 15/8/5.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import "SocreView.h"
#import "UIColor+GameColor.h"
#import "UIView+YUStyle.h"
#define FONT_SIZE 20
@implementation SocreView
-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
    
        [self setUp];
        
    }
    
    return self;
    
}

-(void)setUp{

    _socreLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [self y_Width] , [self y_Height])];
    [_socreLabel setTextColor:[UIColor blackColor]];
    [_socreLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
    [_socreLabel setText:@"分数:200"];
    [self addSubview:_socreLabel];
    
    
}
@end
