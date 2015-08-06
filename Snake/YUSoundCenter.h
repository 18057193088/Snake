//
//  YUSoundCenter.h
//  YUANBAOAPP
//
//  Created by yxy on 14-10-31.
//  Copyright (c) 2014年 ATAW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface YUSoundCenter : NSObject<AVAudioPlayerDelegate>

+(YUSoundCenter *)share;

@property(strong,nonatomic) AVAudioPlayer * player  ;

@property(assign,nonatomic) BOOL yRepeatFlag ;

-(void)yPlay_SEZI_Sound;

@end
