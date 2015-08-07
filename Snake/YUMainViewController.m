//
//  YUMainViewController.m
//  Snake
//
//  Created by yxy on 15/8/5.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import "YUMainViewController.h"
#import "UIColor+GameColor.h"
#import "SocreView.h"
#import "CONST_PUBLIC.h"

#import "UIView+YUStyle.h"
#import "StartButton.h"
#import "GameZoneModel.h"

#import "SnakeBodyView.h"
#define PADDING 20
#define VIRTUAL_BOX_HEIGH 160
@interface YUMainViewController ()
{

    CGPoint _startPoint;
    
}
@end

@implementation YUMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUp];
    
}
-(void)setUp{

    self.view.backgroundColor = [UIColor happyPink];
    
    _gameScoreView = [[SocreView alloc]initWithFrame:CGRectMake(PADDING, 10, SCREEN_WIDTH -PADDING *2, 20)];
    
    [self.view addSubview:_gameScoreView];
    
    _gameZoneView = [[GameZoneView alloc]initWithFrame:CGRectMake(PADDING, SCREEN_HEIGH * 0.07, (int)(SCREEN_WIDTH - PADDING *2), SNAKE_BODY_COL_COUNT)];

    _gameZoneView.deledge= self;
    

    
    [self.view addSubview:_gameZoneView];
    
    _startButton = [[StartButton alloc]initWithFrame:CGRectMake(0, 0, [_gameZoneView y_Width ]*0.5, 50)];
    [self.view addSubview:_startButton];
    
    [_startButton y_setAlign:5];
    
    [self startButtonEvent];
    

    
//    _virtualKeyBoard = [[VirtualKeyBoard alloc]initWithFrame:CGRectMake(PADDING, 0, SCREEN_WIDTH - PADDING *2, VIRTUAL_BOX_HEIGH)];
//    
//    _virtualKeyBoard.deledge = self;
//    
//    
//    [self.view addSubview:_virtualKeyBoard];
//     
//    
//    [_virtualKeyBoard y_setBottom:PADDING];
//    
//    float half = (SCREEN_HEIGH - [_gameZoneView y_BottomY])/2;
//    
//    _virtualKeyBoard.center = CGPointMake(_gameZoneView.center.x, SCREEN_HEIGH - half);
    
    
    [self addSwipHand];
    
}

-(void)addSwipHand{

    UISwipeGestureRecognizer * reg =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipHand:)];
    [reg setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:reg];
    
     reg =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipHand:)];
    [reg setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:reg];
    
    reg =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipHand:)];
    [reg setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:reg];
    
    reg =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipHand:)];
    [reg setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:reg];
    
}

-(void)dirctionButtonTouchUpInSide:(int)tag{
    int dir[4] = {DirctionLeft,DirctionTop,DirctionRight,DirctionBottom};
    
    [self handDirctSip:dir[tag]];
    

}



-(void)gameOver{

    [self showStartButton];
    
}
-(void)startButtonEvent{

    __weak typeof (self) weakSelf = self;
    _startButton.touchCallBack = ^(){
    
        [weakSelf.gameZoneView startGame];
        [weakSelf hideStarButton];
        
    };
    
}
/*开始按钮*/
-(void)showStartButton{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [_startButton y_setAlign:5];
        
        _startButton.alpha = 1 ;
    }];
}

-(void)hideStarButton{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [_startButton y_setTop:SCREEN_HEIGH];
        _startButton.alpha = 0 ;
        
    }];
    
    
}

-(void)swipHand:(UISwipeGestureRecognizer *)reg{

    switch (reg.direction) {
        case UISwipeGestureRecognizerDirectionDown:
        {
        
            [self handDirctSip:DirctionBottom];
            
        }
            break;
        case UISwipeGestureRecognizerDirectionLeft:
        {
            
            [self handDirctSip:DirctionLeft];
            
        }
            break;
        case UISwipeGestureRecognizerDirectionRight:
        {
            
            [self handDirctSip:DirctionRight];
            
        }
            break;
        case UISwipeGestureRecognizerDirectionUp:
        {
            
            [self handDirctSip:DirctionTop];
            
        }
            break;
            
        default:
            break;
    }

}

-(void)handDirctSip:(Dirction)dir{
    
    
    if(_gameZoneView.model.isGameRunnig == NO){
    
        return;
        
    }
    /*
        取消掉逆方向操作
     
     */
  
    
    switch (dir) {
        case DirctionBottom:
        {
            if(_gameZoneView.curDirction == DirctionTop){
                
                break;
                
            }
            _gameZoneView.curDirction = DirctionBottom;
          
            
        }
            break;
            
        case DirctionLeft:
        {
            
            if(_gameZoneView.curDirction == DirctionRight){
                
                break;
                
            }
         
            _gameZoneView.curDirction = DirctionLeft;
        }
            break;
            
        case DirctionRight:
        {
            if(_gameZoneView.curDirction == DirctionLeft){
            
            break;
            
            }
        
            _gameZoneView.curDirction = DirctionRight;
            
        }
            break;
            
        case DirctionTop:{
            if(_gameZoneView.curDirction == DirctionBottom){
                
                break;
                
            }
            _gameZoneView.curDirction = DirctionTop;
            
        }
            
            break;
            
            
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
