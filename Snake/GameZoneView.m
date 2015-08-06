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
#import "GameZoneModel.h"
#import "Fruit.h"
#import "CONST_FRUITE_TYPE.h"

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
    self.clipsToBounds = YES;
    
    self.backgroundColor =[UIColor happygray ];
    self.layer.masksToBounds= YES;
    self.layer.cornerRadius = 10;
    
    _fruitViewArr = [[NSMutableArray alloc]init];
    
    
    
    [self initModel];
    
    [self resetGame];
    
    [self randomMakeFruite];
    
   [self animation];
    
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(randomMakeFruite) userInfo:nil repeats:YES];
    
    
}



-(void)initModel{
    
    _model = [[GameZoneModel alloc]init];
    _model.isGameRunnig = YES;

}
-(void)makeRand{

    NSDate *date = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];//设置成中国阳
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |
    NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit |
    NSMinuteCalendarUnit | NSSecondCalendarUnit;//这句我也不明白具体时用来做什么。。。
    
    comps = [calendar components:unitFlags fromDate:date];
    
 
    NSInteger second=[comps second];//获取秒对应的长整形字符串
    
    for(int i = 0 ; i<second ;i++){
    
        rand();
        
    }
}
/*
 
 中心点转换成行列
 */

-(void)resetGame{
    
    for(UIView * v in self.subviews){
    
        [v removeFromSuperview];
        
    }
    _curDirction  = DirctionRight;
    
    snakeWidth  = [self y_Width]/ SNAKE_BODY_COL_COUNT;
    
    CGPoint snakeHeadPoint = [self rowColToLeftAndTop:[[RowCol alloc] initWithRowCol:SNAKE_BODY_ROW_COUNT/2 col:SNAKE_BODY_COL_COUNT/2]];
    
    SnakeBodyView * snakeHead = [[SnakeBodyView alloc]initWithFrame:CGRectMake(snakeHeadPoint.x, snakeHeadPoint.y, snakeWidth, snakeWidth)];
    
    _curHeadSnakeBody = snakeHead;
    _curTailSnakeBody = snakeHead;
    
    
    [self addSubview:snakeHead];

    [self y_setHeight:SNAKE_BODY_ROW_COUNT * snakeWidth ];
    
    for(int i = 0 ; i <2 ; i++){
        [self addNewSnakeHead];
        
    }

    [_model resetMap];
    
}
-(void)gameOver{

    _model.isGameRunnig = NO;
    [self resetGame];
    
}
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
    
    SnakeBodyView * snakeBody= [[SnakeBodyView alloc]initWithFrame:_curTailSnakeBody.frame];
    
    _curTailSnakeBody.nextBody = snakeBody;
    
    [self addSubview:snakeBody];

    _curTailSnakeBody =  snakeBody;

    
}

-(void)animation{
    if(!_model.isGameRunnig){
    
        return;
        
    }
    [UIView animateWithDuration:_model.curSpeed animations:^{

    
        
        SnakeBodyView * body = _curHeadSnakeBody;

        
        NSMutableArray * bodys = [[NSMutableArray alloc]init];
        
        while (body) {
            
            [bodys addObject:body];
            
            body = body.nextBody;
        }
        for(NSInteger i  = bodys.count -1 ; i >0 ; i --){
            
            SnakeBodyView * curBody = bodys[i];
            
            SnakeBodyView * lastBody = bodys[i-1];
            
            [curBody y_setLeft:lastBody.frame.origin.x];
            
            [curBody y_setTop:lastBody.frame.origin.y];
        
        }
        
        switch (_curDirction) {
            case DirctionTop:
            {
                [_curHeadSnakeBody y_setTop:[_curHeadSnakeBody y_TopY] - snakeWidth];
            
            }
                break;
                
            case DirctionBottom:
            {
               [_curHeadSnakeBody y_setTop:[_curHeadSnakeBody y_TopY] + snakeWidth];
                
                
            }
                break;
                
            case DirctionLeft:
            {
                [_curHeadSnakeBody y_setLeft:[_curHeadSnakeBody y_LeftX] - snakeWidth ];
                
                
            }
                break;
                
            case DirctionRight:
            {
                [_curHeadSnakeBody y_setLeft:[_curHeadSnakeBody y_LeftX] +snakeWidth ];
                
                
            }
                break;
                
            default:
                break;
        }
        
        
        if(![self isNextStepVaid:_curHeadSnakeBody.center]){
        
            [self gameOver];
            
            
        }
        [self detectionThiStep:_curHeadSnakeBody.center];
        
        
        
    } completion:^(BOOL finished) {
        [self animation];
        
    }];
    
}

/*位置时候*/

-(BOOL)isNextStepVaid:(CGPoint)centPoint{
 RowCol * bodyRowcol =  [self BodyViewCenterPointToLogicPoint:centPoint];

    if(bodyRowcol.row<0 || bodyRowcol.col <0 || bodyRowcol.row >= SNAKE_BODY_ROW_COUNT || bodyRowcol.col >=SNAKE_BODY_COL_COUNT){
        
        return NO;
        
    }
    
    SnakeBodyView * body = _curHeadSnakeBody;
    while (body) {
         body = body.nextBody;
        if(body){
            
            if(_curHeadSnakeBody.center.x == body.center.x && _curHeadSnakeBody.center.y == body.center.y){
                return NO;
                
            }
        
        }
        
        
       
    }

    return YES;
    

}

-(void)detectionThiStep:(CGPoint)centerPoint{

   RowCol * rowcol =  [self BodyViewCenterPointToLogicPoint:centerPoint];
    
    int fruitType =[_model mapValue:rowcol.row col:rowcol.col];
    
    if(fruitType >=0 && fruitType <=FRUIT_NEW_BODY_END_INDEX){
    

        [self clearFruite:rowcol.row col:rowcol.col];
        
        
        [self addNewSnakeHead];
        
     
    }
    
  
    
    if(fruitType == FRUIT_NEW_BODY_TYPE){
        
        
        
    }else if(fruitType == FRUIT_NEW_BODY_SPEED_UP_TYPE){
        
        _model.curSpeed*=0.5;
        
        
    
    }else if(fruitType == FRUIT_NEW_BODY_SPEED_SLOW_TYPE){
        _model.curSpeed*=1.5;
        
        
    }
    
}
-(void)clearFruite:(int)row col:(int) col{
    
    [_model clearMap:row col:col];
    for(Fruit * fruit in _fruitViewArr){
    
        if(fruit.rowcol.row == row && fruit.rowcol.col == col){
        
            [fruit removeFromSuperview];
            break;
        }
    }
}

-(void)randomMakeFruite{

    [self makeRand];
    
    
    int row = rand() % SNAKE_BODY_ROW_COUNT;
    int col = rand() % SNAKE_BODY_COL_COUNT;
    int fruitType = rand() % 3 ;
    
    [_model setMapValue:row col:col value:fruitType];
    
    CGPoint origin = [self rowColToLeftAndTop:[[RowCol alloc] initWithRowCol:row col:col]];
    
    Fruit * fruit = [[Fruit alloc]initWithFrame:CGRectMake(origin.x, origin.y, snakeWidth, snakeWidth)];
    
    fruit.rowcol = [[RowCol alloc]initWithRowCol:row col:col];
    
    fruit.type= fruitType;
    
    [_fruitViewArr addObject:fruit];
    
    
    [self addSubview:fruit];
    
    
}


@end
