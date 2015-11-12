//
//  CBQuestion.m
//  Day04
//
//  Created by C_bin on 15/11/11.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "CBQuestion.h"

@implementation CBQuestion

-(instancetype)initWithDic:(NSDictionary*)dic
{
    if (self = [super init]) {
        self.answer      = dic[@"answer"];
        self.title       = dic[@"title"];
        self.icon        = dic[@"icon"];
        self.options     = dic[@"options"];
    }
    return self;
}

+(instancetype) questionWithDic:(NSDictionary*)dic
{
    return [[self alloc] initWithDic:dic];
}

+(NSArray*)questionsList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    //字典转模型
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        
        CBQuestion *question = [CBQuestion questionWithDic:dic];
        
        [tmpArray addObject:question];
    }
    return tmpArray;
}


@end
