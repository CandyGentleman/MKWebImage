//
//  UIImageView+MKWebImage.h
//  MKWebImage
//
//  Created by liulujie on 15/12/7.
//  Copyright © 2015年 liulujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (MKWebImage)

-(void)setUpImageWithUrlString:(NSString *)urlString placeholder:(NSString *)imageName;

@end