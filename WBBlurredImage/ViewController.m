//
//  ViewController.m
//  WBBlurredImage
//
//  Created by 吴飚 on 2016/10/28.
//  Copyright © 2016年 wubiao. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WBBlurredImage.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.imageView];
    [self.imageView setImageToBlur:[UIImage imageNamed:@"example"]
                        blurRadius:kWBBlurredImageDefaultBlurRadius
                   completionBlock:^(){
                       NSLog(@"The blurred image has been set");
                   }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
