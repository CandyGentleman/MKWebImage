//
//  MKReadAndWriteToSandbox.h
//  第四天图片下载
//
//  Created by liulujie on 15/12/5.
//  Copyright © 2015年 liulujie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface MKReadAndWriteToSandbox : NSObject

-(NSString *)getImagePathAbuotIconName:(NSString *)iconName;

-(UIImage *)readImageFromSandbox:(NSString *)iconName;

-(void)writeImageToSandbox:(UIImage *)image addiconName:(NSString *)iconName;

+(instancetype)shareSandbox;


@end
