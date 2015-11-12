//
//  CBQuestion.h
//  Day04
//
//  Created by C_bin on 15/11/11.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBQuestion : NSObject

@property (nonatomic,copy) NSString *answer;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) NSArray *options;

-(instancetype)initWithDic:(NSDictionary*)dic;

+(instancetype) questionWithDic:(NSDictionary*)dic;

+(NSArray*)questionsList;

@end

