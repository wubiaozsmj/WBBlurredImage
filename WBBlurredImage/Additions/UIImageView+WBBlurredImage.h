//
//  UIImageView+WBBlurredImage.h
//  WBBlurredImage
//
//  Created by 吴飚 on 2016/10/28.
//  Copyright © 2016年 wubiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WBBlurredImageCompletionBlock)(void);

extern CGFloat const kWBBlurredImageDefaultBlurRadius;

@interface UIImageView (WBBlurredImage)

- (void)setImageToBlur:(UIImage *)image
            blurRadius:(CGFloat)blurRadius
       completionBlock:(WBBlurredImageCompletionBlock)completion;

- (void)setImageToBlur:(UIImage *)image
       completionBlock:(WBBlurredImageCompletionBlock)completion;

@end
