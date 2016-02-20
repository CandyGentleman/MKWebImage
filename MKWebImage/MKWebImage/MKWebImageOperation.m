//
//  MKWebImageOperation.m
//  MKWebImage
//
//  Created by liulujie on 14/12/7.
//  Copyright © 2014年 liulujie. All rights reserved.
//

#import "MKWebImageOperation.h"
#import "MKReadAndWriteToSandbox.h"

@implementation MKWebImageOperation

-(void)main{
    @autoreleasepool {
        
        self.image = [self downLoadImages:self.iconName];

        dispatch_async(dispatch_get_main_queue(), ^{
        
            if (self.myblock) {
                self.myblock(self);
            }
        });
    }
}


-(void)setValueBlock:(webImageBlock)myblock{
    
    if (myblock) {
        self.myblock = myblock;
    }
}


// 根据传过来的NSString 下载图片
-(UIImage *)downLoadImages:(NSString *)string{
  
    if (self.cancelled) {
        return nil;
    }
    
    NSURL *url = [NSURL URLWithString:string];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData:data];
    
    if (self.cancelled) {
        return nil;
    }
    // 将图片保存到沙盒
    if (image) {
        NSString *path  = [[MKReadAndWriteToSandbox shareSandbox] getImagePathAbuotIconName:string];
        [data writeToFile:path atomically:YES];
    }
    
    return image;
}


@end
