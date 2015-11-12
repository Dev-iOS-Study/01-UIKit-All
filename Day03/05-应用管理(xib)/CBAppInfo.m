//
//  CBAppInfo.m
//  Day03
//
//  Created by C_bin on 15/11/8.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "CBAppInfo.h"

@implementation CBAppInfo

-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.name = dic[@"name"];
        self.icon = dic[@"icon"];
    }
    return self;
}

+(instancetype)appInfoWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+(NSArray*)appInfoList
{
    NSBundle *bundle                = [NSBundle mainBundle];
    NSString *path                  = [bundle pathForResource:@"app" ofType:@"plist"];
    NSArray  *dicArray              = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *mutableArray    = [NSMutableArray array];
    for (NSDictionary *dict in dicArray) {
        CBAppInfo *appInfo          = [CBAppInfo appInfoWithDic:dict];
        [mutableArray addObject:appInfo];
    }
    return mutableArray;
}

@end
