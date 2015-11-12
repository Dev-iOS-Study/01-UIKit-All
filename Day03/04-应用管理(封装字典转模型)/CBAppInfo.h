//
//  CBAppInfo.h
//  Day03
//
//  Created by C_bin on 15/11/8.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBAppInfo : NSObject

//属性
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *name;

-(instancetype) initWithDic:(NSDictionary*)dic;
+(instancetype) appInfoWithDic:(NSDictionary*)dic;

+(NSArray*)appInosList;

@end
