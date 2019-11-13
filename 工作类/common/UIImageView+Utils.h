//
//  UIImageView+Utils.h
//  DupiPlanet
//
//  Created by zhaoxy on 14/11/7.
//  Copyright (c) 2014年 team108. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Utils)

- (void)sizeToFitWidth:(NSInteger)width;
- (void)sizeToFitWidth:(NSInteger)width scale:(BOOL)isScale;
- (void)sizeToFitHeight:(NSInteger)height;

@end
