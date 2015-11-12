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
        self.icon = dic[@"icon"];
        self.name = dic[@"name"];
    }
    return self;
}

+(instancetype)appInfoWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+(NSArray*)appInosList
{
    NSBundle * bundle = [NSBundle mainBundle];
    NSString * path   = [bundle pathForResource:@"app" ofType:@"plist"];
    NSArray  * array  = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [mutableArray addObject:[CBAppInfo appInfoWithDic:dict]];
    }
    return mutableArray;
}

@end
