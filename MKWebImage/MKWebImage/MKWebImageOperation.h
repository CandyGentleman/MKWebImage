//
//  MKWebImageOperation.h
//  MKWebImage
//
//  Created by liulujie on 15/12/7.
//  Copyright © 2015年 liulujie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@class MKWebImageOperation;


typedef void(^webImageBlock)(MKWebImageOperation *opration);


@interface MKWebImageOperation : NSOperation


@property (nonatomic, copy)NSString *iconName;

@property (nonatomic, strong) UIImage *image;


@property (nonatomic, copy)webImageBlock myblock;

-(void)setValueBlock:(webImageBlock)myblock;

@end
