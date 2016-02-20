//
//  MKReadAndWriteToSandbox.m
//  第四天图片下载
//
//  Created by liulujie on 14/12/7.
//  Copyright © 2014年 liulujie. All rights reserved.
//

#import "MKReadAndWriteToSandbox.h"

@implementation MKReadAndWriteToSandbox

//获取图片的沙盒路径
-(NSString *)getImagePathAbuotIconName:(NSString *)iconName{
    
  NSString *string1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;

    
  NSString *string2 = [string1 stringByAppendingPathComponent:iconName.lastPathComponent];
   
    return string2;
    
}


// 从沙河中读取数据
-(UIImage *)readImageFromSandbox:(NSString *)iconName{
    
    NSString *path = [self getImagePathAbuotIconName:iconName];
    
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    
    return image;
}


-(void)writeImageToSandbox:(UIImage *)image addiconName:(NSString *)iconName{
    
    NSString *path = [self getImagePathAbuotIconName:iconName];
    
    
    NSData *data = UIImagePNGRepresentation(image);
    
    
    // 将数据写入到沙盒路径中
    [data writeToFile:path atomically:YES];

}


// 单例对象
+(instancetype)shareSandbox{
  
    static id  _instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
    
}
@end
