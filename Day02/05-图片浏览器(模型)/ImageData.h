//
//  imageData.h
//  Day02
//
//  Created by C_bin on 15/11/4.
//  Copyright © 2015年 C_bin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageData : NSObject

//属性
@property (weak,nonatomic) NSString *imageName;
@property (weak,nonatomic) NSString *desc;

+(id) imageDataWithDict:(NSDictionary *) dict;
-(id) initWithDict:(NSDictionary *) dict;

@end
