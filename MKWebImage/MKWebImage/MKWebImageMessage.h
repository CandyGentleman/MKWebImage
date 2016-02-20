//
//  MKWebImageMessage.h
//  MKWebImage
//
//  Created by liulujie on 14/12/7.
//  Copyright © 2014年 liulujie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void(^setUpImageBlock)(UIImage *image);

@interface MKWebImageMessage : NSObject

@property (nonatomic, copy)setUpImageBlock myBlock;

@property (nonatomic, strong) NSMutableDictionary *images;

+(instancetype)shareInstance;


-(void)downloadImage:(NSString *)iconString addblock:(setUpImageBlock)myBlock;



-(void)cancelOperationWithUrlString:(NSString *)iconName;

@end
