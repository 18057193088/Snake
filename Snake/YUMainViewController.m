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
#import "GameZoneView.h"
#import "UIView+YUStyle.h"
#define PADDING 20
@interface YUMainViewController ()

@end

@implementation YUMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUp];
    
}
-(void)setUp{

    self.view.backgroundColor = [UIColor happyYellow];
    
    _gameScoreView = [[SocreView alloc]initWithFrame:CGRectMake(PADDING, PADDING, SCREEN_WIDTH -PADDING *2, 20)];
    
    [self.view addSubview:_gameScoreView];
    
    _gameZoneView = [[GameZoneView alloc]initWithFrame:CGRectMake(PADDING, SCREEN_HEIGH * 0.1, SCREEN_WIDTH - PADDING *2, SNAKE_BODY_COL_COUNT)];
    
    UISwipeGestureRecognizer * swip = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(dirctSip:)];
    
    [self.view addGestureRecognizer:swip];

    [self.view addSubview:_gameZoneView];
    
}

-(void)dirctSip:(UISwipeGestureRecognizer *)ges{
    
    switch (ges.direction) {
        case UISwipeGestureRecognizerDirectionDown:
        {
            _gameZoneView.curDirction = DirctionBottom;
            
        }
            break;
            
        case UISwipeGestureRecognizerDirectionLeft:
        {
        
            _gameZoneView.curDirction = DirctionLeft;
        }
            break;
            
        case UISwipeGestureRecognizerDirectionRight:
        {
        
            _gameZoneView.curDirction = DirctionRight;
            
        }
            break;
            
        case UISwipeGestureRecognizerDirectionUp:{
        
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
