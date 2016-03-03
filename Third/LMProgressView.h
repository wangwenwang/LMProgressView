//
//  ProgressView.h
//  CBDFurniture
//
//  Created by cbd on 15/12/25.
//  Copyright © 2015年 com.CBD.furniture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMProgressView : UIView

@property (assign, nonatomic)CGFloat progress;          //长度

@property (strong, nonatomic)UIColor *progressColor;    //颜色

@property (assign, nonatomic)CGFloat lineWidth;         //宽度

@property (assign, nonatomic)CGFloat x;                 //起点X

@property (assign, nonatomic)CGFloat y;                 //起点Y

@property (strong, nonatomic)UIFont  *font;             //字体大小

@property (strong, nonatomic)UIColor *textColor;        //字体颜色

@end
