//
//  ViewController.m
//  MKWebImage
//
//  Created by liulujie on 15/12/7.
//  Copyright © 2015年 liulujie. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+MKWebImage.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imageView setUpImageWithUrlString:@"http://g.hiphotos.baidu.com/image/h%3D300/sign=6f537ad2273fb80e13d167d706d02ffb/4034970a304e251ffb70921ba186c9177e3e5349.jpg" placeholder:nil];

}



@end
