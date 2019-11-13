//
//  UIImageView+Utils.m
//  DupiPlanet
//
//  Created by zhaoxy on 14/11/7.
//  Copyright (c) 2014年 team108. All rights reserved.
//

#import "UIImageView+Utils.h"

@implementation UIImageView (Utils)

- (void)sizeToFitWidth:(NSInteger)width {
     [self sizeToFitWidth:width scale:NO];
}

- (void)sizeToFitWidth:(NSInteger)width scale:(BOOL)isScale {
    NSInteger screenWidth = isScale?width:MIN(width, self.image.size.width);
    NSInteger screenHeight = screenWidth * self.image.size.height/self.image.size.width;
     self.size = CGSizeMake(screenWidth, screenHeight);
}

- (void)sizeToFitHeight:(NSInteger)height {
    NSInteger screenHeight = MIN(height, self.image.size.height);
    NSInteger screenWidth = screenHeight * self.image.size.width/self.image.size.height;
     self.size = CGSizeMake(screenWidth, screenHeight);
}

@end
