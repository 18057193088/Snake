//
//  GameZoneView.m
//  Snake
//
//  Created by yxy on 15/8/5.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import "GameZoneView.h"
#import "SnakeBodyView.h"
#import "CONST_PUBLIC.h"
#import "UIView+YUStyle.h"
#import "RowCol.h"
#import "UIColor+GameColor.h"
@implementation GameZoneView
{

    float snakeWidth;
    
}
-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if(self){
        
        [self setUp];
        
    }
    return self;
    
}

-(void)setUp{
    
    self.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.layer.borderWidth = 1;
    
    _curDirction  = DirctionRight;
    
    snakeWidth  = [self y_Width]/ SNAKE_BODY_COL_COUNT;
    
    CGPoint snakeHeadPoint = [self rowColToLeftAndTop:[[RowCol alloc] initWithRowCol:SNAKE_BODY_ROW_COUNT/2 col:SNAKE_BODY_COL_COUNT/2]];
    
    SnakeBodyView * snakeHead = [[SnakeBodyView alloc]initWithFrame:CGRectMake(snakeHeadPoint.x, snakeHeadPoint.y, snakeWidth, snakeWidth)];
    
    _curHeadSnakeBody = snakeHead;
    
    [self addSubview:snakeHead];
    
    _curHeadSnakeBody.lastTimePoint = _curHeadSnakeBody.frame.origin;
    
    
    [self y_setHeight:SNAKE_BODY_ROW_COUNT * snakeWidth ];
    
    for(int i = 0 ; i <2 ; i++){
        [self addNewSnakeHead];
    
    }
    
    [self animation];
    
}

/*
 
 中心点转换成行列
 */

-(RowCol *)BodyViewCenterPointToLogicPoint:(CGPoint)point{

    int col = point.x /  snakeWidth;
    int row = point.y / snakeWidth;
    RowCol * rowcol =[[RowCol alloc]init];
    rowcol.row = row;
    rowcol.col = col;
    return rowcol;
}
/*
 行列转化成中心点
 
 */
-(CGPoint)rowColToLeftAndTop:(RowCol *)rowcol{
    
    return CGPointMake(rowcol.col * snakeWidth, rowcol.row * snakeWidth);

}
/*
 
 新增蛇头
 
 */

-(void)addNewSnakeHead{
    

    
    SnakeBodyView * snakeHead = [[SnakeBodyView alloc]initWithFrame:CGRectMake(0, 0 ,snakeWidth, snakeWidth)];
    
    snakeHead.nextBody = _curHeadSnakeBody;
    
    [snakeHead y_rightFromView:_curHeadSnakeBody distance:0];
    [snakeHead y_setTop:[_curHeadSnakeBody y_TopY]];
    
    
    
    [self addSubview:snakeHead];
    
    _curHeadSnakeBody = snakeHead;
    
    
    switch (_curDirction) {
        case DirctionTop:
        {
        
        
        }
            break;
        
            
        default:
            break;
    }
    
    
}

-(void)animation{

    [UIView animateWithDuration:0.5 animations:^{
        

        
        _curHeadSnakeBody.backgroundColor = [UIColor happyBlue];
        
        SnakeBodyView * body = _curHeadSnakeBody;
        
        NSMutableArray * bodys = [[NSMutableArray alloc]init];
        
        while (body) {
            
            [bodys addObject:body];
            
            body.backgroundColor = [UIColor happyPink ];
            
            body = body.nextBody;
        }
        for(NSInteger i  = bodys.count -1 ; i >0 ; i --){
            
            SnakeBodyView * curBody = bodys[i];
            
            SnakeBodyView * lastBody = bodys[i-1];
            
            [curBody y_setLeft:lastBody.frame.origin.x];
            
            [curBody y_setTop:lastBody.frame.origin.y];
        
        }
        [_curHeadSnakeBody y_setLeft:[_curHeadSnakeBody y_LeftX] + snakeWidth];
        
        
        
    } completion:^(BOOL finished) {
        [self animation];
        
    }];
    
}

@end
