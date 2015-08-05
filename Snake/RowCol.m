//
//  RowCol.m
//  Snake
//
//  Created by yxy on 15/8/5.
//  Copyright (c) 2015年 YeXiaYun. All rights reserved.
//

#import "RowCol.h"

@implementation RowCol
-(id)initWithRowCol:(int) row col:(int)col{

    self =[super init];
    if(self){
    
    
        self.row =row;
        self.col = col;
        
    
    }
    
    return self;
    


}
@end
