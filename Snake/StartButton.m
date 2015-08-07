//
//  StartButton.m
//  Snake
//
//  Created by yxy on 15/8/7.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import "StartButton.h"
#import "UIColor+GameColor.h"
#define FONT_SIZE 20
@implementation StartButton

-(id)initWithFrame:(CGRect)frame{

    self =[ super initWithFrame:frame];
    if(self){
        [self setUp];
        
    }
    return self;
    
}

-(void)setUp{
    
    self.backgroundColor = [UIColor happyPink];
    

    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 0.5;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    self.alpha = 0.9 ;
    _titleLabel = [[UILabel alloc]initWithFrame:self.bounds];
    [self addSubview:_titleLabel];
    [_titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
    [_titleLabel setTextColor:[UIColor whiteColor]];
    
    [_titleLabel setText:@"开始"];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    _button = [[UIButton alloc]initWithFrame:self.bounds];
    [self addSubview:_button];
    [_button addTarget:self action:@selector(buttonTouchUpInSide:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)buttonTouchUpInSide:(id)sender{
    
    if(_touchCallBack){
    
        _touchCallBack();
        
    }
}
@end
