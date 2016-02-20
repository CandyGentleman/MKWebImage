//
//  UIImageView+MKWebImage.m
//  MKWebImage
//
//  Created by liulujie on 14/12/7.
//  Copyright © 2014年 liulujie. All rights reserved.
//

#import "UIImageView+MKWebImage.h"
#import "MKWebImageMessage.h"
#import "MKReadAndWriteToSandbox.h"
#import <objc/runtime.h>



@interface UIImageView ()

@property (nonatomic, copy) NSString *urlString;

@end

@implementation UIImageView (MKWebImage)

const void *urlstringKey = @"urlString";


// 动态运行时，执行的代码
-(void)setUrlString:(NSString *)urlString{
    
    objc_setAssociatedObject(self, urlstringKey, urlString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)urlString{
    
  return objc_getAssociatedObject(self, urlstringKey);
    
}

//根据图片标示， 下载图片
-(void)setUpImageWithUrlString:(NSString *)urlString placeholder:(NSString *)imageName{

    
    MKWebImageMessage *message = [MKWebImageMessage shareInstance];
    
    UIImage *image = message.images[urlString];
    
     //从缓存中加载数据
    if (image) {
        self.image = image;
        NSLog(@"从缓存中加载数据");
        return;
    }
    
    // 判断沙盒中是否有数据；
    UIImage *image1  = [[MKReadAndWriteToSandbox shareSandbox] readImageFromSandbox:urlString];
    if (image1) {
        self.image = image1;
        NSLog(@"从沙河中读出数据");
        [message.images setObject:image1 forKey:urlString];
        return;
    }
    
    
    self.image =[UIImage imageNamed:imageName];
    
    if (self.urlString && [self.urlString isEqualToString:urlString]) {
        NSLog(@"滑动后的图片，和现在的一样,不需要取消操作");
        return;
    }
    
    //
    if (self.urlString && ![self.urlString isEqualToString:urlString]) {
        NSLog(@"取消当前的操作，下载新的操作");
        
        //删除当前的操作
        [message cancelOperationWithUrlString:urlString];
        
        self.urlString = urlString;
        
        [message downloadImage:urlString addblock:^(UIImage *image) {
            self.image = image;
            NSLog(@"从新下载图片");
        }];
    }
    
    if (!self.urlString) {
        self.urlString = urlString;
        
        // 下载图片
        [message downloadImage:urlString addblock:^(UIImage *image) {
            self.image = image;
            NSLog(@"从新下载图片");
        }];
    }
 
   
}
@end
