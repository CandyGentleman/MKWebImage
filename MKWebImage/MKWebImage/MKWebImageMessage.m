//
//  MKWebImageMessage.m
//  MKWebImage
//
//  Created by liulujie on 14/12/7.
//  Copyright © 2014年 liulujie. All rights reserved.
//

#import "MKWebImageMessage.h"
#import "MKWebImageOperation.h"


@interface MKWebImageMessage ()

@property (nonatomic, strong) NSMutableDictionary *optation;

@property (nonatomic, strong) NSOperationQueue *queue;

@end



@implementation MKWebImageMessage

-(NSOperationQueue *)queue{
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
        
    }
    return _queue;
}

-(NSMutableDictionary *)optation{
    if (_optation == nil) {
        _optation = [NSMutableDictionary dictionary];
    }
    return _optation;
}

-(NSMutableDictionary *)images{
    if (_images == nil) {
        _images = [NSMutableDictionary dictionary];
    }
    return _images;
    
}

// 下载一张图片
-(void)downloadImage:(NSString *)iconString addblock:(setUpImageBlock)myBlock{
  
    MKWebImageMessage *op1 = [[MKWebImageMessage alloc] init];
    if (op1) {
        return;
    }

    MKWebImageOperation *op = [[MKWebImageOperation alloc] init];
    
    op.iconName = iconString;
    
    
    [op setValueBlock:^(MKWebImageOperation *opration) {
        
        
        if (opration.image) {
            
            // 返回图片
            if (myBlock) {
                myBlock(opration.image);
            }
            
            // 将图片存到字典中
            [self.images setObject:opration.image forKey:iconString];
            
            // 将当前操作移除
            [self.optation removeObjectForKey:iconString];
        }
    
    }];
    // 将操作添加到缓存
    [self.optation setObject:op forKey:iconString];
    
    [self.queue addOperation:op];

}


// 删除当前的操作
-(void)cancelOperationWithUrlString:(NSString *)iconName{
    MKWebImageOperation *op = [[MKWebImageOperation alloc] init];
    [op cancel];
    // 从操作缓存中删除操作
    [self.optation removeObjectForKey:iconName];
}

// 创建单例模式
+(instancetype)shareInstance{
    
    static  id _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
        
    });
    return _instance;
}
@end
