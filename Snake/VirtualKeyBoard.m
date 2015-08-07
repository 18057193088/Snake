//
//  VirtualKeyBoard.m
//  Snake
//
//  Created by yxy on 15/8/7.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import "VirtualKeyBoard.h"
#import "UIView+YUStyle.h"
#import "UIColor+GameColor.h"
@implementation VirtualKeyBoard
-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
    
        [self setUp];
        
    }
    return self;
    
}

-(void)setUp{
    _buttonArray =[[NSMutableArray alloc]init];
    _leftBoard = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [self y_Height], [self y_Height])];
    [self addSubview:_leftBoard];
    
    int dir[4] = {4,8,6,2};
    for(int i =0 ; i<4;i++){
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 55, 55)];
        [_leftBoard addSubview:btn];
        [btn setBackgroundColor:[UIColor happyYellow]];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius =[btn y_Width] *0.3;
        btn.layer.borderColor = [UIColor whiteColor].CGColor;
        btn.layer.borderWidth = 0.5 ;
        [btn addTarget:self action:@selector(dirctionButtonTouchUpInSide:) forControlEvents:UIControlEventTouchDown];
        btn.tag = i ;
        
        [btn y_setAlign:dir[i]];
        
    }
    
    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
    [btn setBackgroundColor:[UIColor happyYellow]];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius =[btn y_Width]/2.0 ;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    btn.layer.borderWidth = 0.5 ;
    [self addSubview:btn];
    [btn y_setAlign:6];
    
    
}
-(void)dirctionButtonTouchUpInSide:(id)sender{
    
    if([_deledge respondsToSelector:@selector(dirctionButtonTouchUpInSide:)]){
        
        UIButton * btn = (UIButton*)sender;
        
        
        [_deledge dirctionButtonTouchUpInSide:(int)btn.tag];
        
        
    }
    

}
@end
