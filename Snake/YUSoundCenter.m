//
//  YUSoundCenter.m
//  YUANBAOAPP
//
//  Created by yxy on 14-10-31.
//  Copyright (c) 2014年 ATAW. All rights reserved.
//

#import "YUSoundCenter.h"

@implementation YUSoundCenter

+(YUSoundCenter *)share{

    static YUSoundCenter * sound = nil;
    
    if(sound == nil){
    
        sound = [[YUSoundCenter alloc]init];
        
        
    }
    
    return sound;
    

}

-(id)init{

    self = [super init];
    if(self){
    
//        _yRepeatFlag = NO;
//        
//        _player = [[AVAudioPlayer alloc]
//                   initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"touzi1" ofType:@"mp3"]] error:nil];//使用本地URL创建
//        _player.volume =0.8;//0.0-1.0之间
//        
//        _player.delegate =self;
//        
//        [_player prepareToPlay];
//        //设置支持变速
//        _player.enableRate = YES;
//        //峰值和平均值
//        _player.meteringEnabled = YES;
    }
    
    
    return self;
    
}

-(void)yPlay_SEZI_Sound{
    
    
//    NSURL * url =[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"touzi1" ofType:@"mp3"]];
//    
//    
//    
//    NSString * str =  [url absoluteString];
//    
//    NSLog(@"%@",str);
//    
//    
//    [_player play];
    
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    //播放结束时执行的动作
    
    if(_yRepeatFlag == YES){
        
        [_player play];
    }
    
    

}



- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error;
{
  
    //解码错误执行的动作
}


- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player;
{
    //处理中断的代码
}
@end
