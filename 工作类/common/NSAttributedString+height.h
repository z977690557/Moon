//
//  NSAttributedString+height.h
//  work
//
//  Created by 郭超 on 16/3/30.
//  Copyright © 2016年 space 5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (height)

- (float) heightWithFont: (UIFont *) font withinWidth: (float) width;
- (float) widthWithFont: (UIFont *) font;
@end
