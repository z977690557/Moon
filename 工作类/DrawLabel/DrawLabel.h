//
//  DrawLabel.h
//  work
//
//  Created by 张晓雷 on 16/3/14.
//  Copyright © 2016年 space 5. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface DrawLabel : UILabel

//@property(nonatomic,assign) UIEdgeInsets edgeInsets;
{
@private
    VerticalAlignment _verticalAlignment;
}

@property (nonatomic) VerticalAlignment verticalAlignment;

-(id) initWithFrame:(CGRect)frame andInsets: (UIEdgeInsets) insets;
-(id) initWithInsets: (UIEdgeInsets) insets;

-(id) initWithFrame:(CGRect)frame font:(CGFloat)font;
@end
