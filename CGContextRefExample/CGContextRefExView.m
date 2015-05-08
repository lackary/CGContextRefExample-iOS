//
//  CGContextRefEx.m
//  CGContextRefExample
//
//  Created by SDC-Henry on 2015/4/21.
//  Copyright (c) 2015年 _LACK_. All rights reserved.
//

#import "CGContextRefExView.h"
#define PI 3.1415926535

@implementation CGContextRefExView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //取得畫板
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //draw text
    //set text color
    CGContextSetRGBFillColor(context, 1.0, 1.0, 0, 1.0); //red
    
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 12], NSForegroundColorAttributeName: UIColor.redColor, NSParagraphStyleAttributeName: textStyle};

    [@"test draw word" drawInRect:CGRectMake(10.0, 10.0, 100, 20) withAttributes:textFontAttributes];
    
    //draw circle
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 1.0);
    //(35.0, 65.0) circle center
    CGContextAddArc(context, 35.0, 65.0, 25.0, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextAddArc(context, 95.0, 65.0, 25, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextAddArc(context, 155.0, 65.0, 25.0, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextAddArc(context, 35.0, 125.0, 25.0, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathEOFill);
    
    CGContextAddArc(context, 95.0, 125.0, 25.0, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathEOFillStroke);
    
    //draw line
    // set three point
    CGPoint points[3] = {CGPointMake(130.0, 100.0), CGPointMake(155.0, 125.0), CGPointMake(180.0, 100)};
    CGContextAddLines(context, points, 3);
    CGContextDrawPath(context, kCGPathStroke);
    
    
    //draw rect stroke
    CGContextStrokeRect(context, CGRectMake(190.0, 40.0, 80.0, 50.0));
    //draw rect fill
    CGContextFillRect(context, CGRectMake(190.0, 100.0, 80.0, 50.0));
    
    CGContextSetLineWidth(context, 1.0);
    UIColor *bColor = [UIColor blueColor];
    //fill
    CGContextSetFillColorWithColor(context, bColor.CGColor);
    UIColor *cColor = [UIColor cyanColor];
    CGContextSetStrokeColorWithColor(context, cColor.CGColor);
    CGContextAddRect(context, CGRectMake(10.0, 160.0, 80.0, 50));
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
