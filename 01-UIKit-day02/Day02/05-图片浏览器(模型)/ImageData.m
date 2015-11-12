//
//  imageData.m
//  Day02
//
//  Created by C_bin on 15/11/4.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import "ImageData.h"

@interface ImageData()



@end

@implementation imageData

+(id) imageDataWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

-(id) initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.imageName = dict[@"icon"];
        self.desc      = dict[@"desc"];
    }
    return self;
}

@end
