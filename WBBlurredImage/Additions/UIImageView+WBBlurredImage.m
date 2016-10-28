//
//  UIImageView+WBBlurredImage.m
//  WBBlurredImage
//
//  Created by 吴飚 on 2016/10/28.
//  Copyright © 2016年 wubiao. All rights reserved.
//

#import "UIImageView+WBBlurredImage.h"
#import "UIImage+ImageEffets.h"

CGFloat const kWBBlurredImageDefaultBlurRadius            = 20.0;
CGFloat const kWBBlurredImageDefaultSaturationDeltaFactor = 1.8;

@implementation UIImageView (WBBlurredImage)

- (void)setImageToBlur:(UIImage *)image
       completionBlock:(WBBlurredImageCompletionBlock)completion
{
    [self setImageToBlur:image
              blurRadius:kWBBlurredImageDefaultBlurRadius
         completionBlock:completion];
}

- (void)setImageToBlur:(UIImage *)image
            blurRadius:(CGFloat)blurRadius
       completionBlock:(WBBlurredImageCompletionBlock) completion
{
    NSParameterAssert(image);
    blurRadius = (blurRadius <= 0) ? kWBBlurredImageDefaultBlurRadius : blurRadius;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *blurredImage = [image applyBlurWithRadius:blurRadius
                                                 tintColor:nil
                                     saturationDeltaFactor:kWBBlurredImageDefaultSaturationDeltaFactor
                                                 maskImage:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = blurredImage;
            if (completion) {
                completion();
            }
        });
    });
}

@end
