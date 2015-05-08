//
//  ViewController.m
//  CGContextRefExample
//
//  Created by SDC-Henry on 2015/4/21.
//  Copyright (c) 2015年 _LACK_. All rights reserved.
//

#import "ViewController.h"

#define PI 3.1415926535

@interface ViewController ()

@end

@implementation ViewController {
    UIImageView *paletteImageView;
    UIImageView *borderRadiusImageView;
    
    UIImageView *circleImageView;
    UIImageView *targetImageView;
    
    
    UIImage *paletteImage;
    UIImage *rectangleImage;
    UIImage *circleImage;
    UIImage *targetImage;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //init UIImageView size and location
    paletteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 20.0, 300.0, 20.0)];
    
    //set UIImageView border thickness
    [[paletteImageView layer] setBorderWidth:2.0];
    
    //set UIImageView border color
    [[paletteImageView layer] setBorderColor:[UIColor blackColor].CGColor];
    //[[paletteImageView layer] setBorderColor:[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.9].CGColor];
    
    //set UIImageView mask if value is no,color will over the border
    [[paletteImageView layer] setMasksToBounds:YES];
    
    paletteImageView.image = [self drawColorSetSize:paletteImageView.frame.size setRed:255.0 setGreen:0.0 setBlue:0.0 setAlpha:1.0];
    
    circleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 50.0, 50.0)];
    
    //set UIImageView border thickness
    [[circleImageView layer] setBorderWidth:2.0];
    
    //set UIImageView border color
    [[circleImageView layer] setBorderColor:[UIColor blackColor].CGColor];
    
    //set UIImageView mask
    [[circleImageView layer] setMasksToBounds:YES];
    
    //draw a circle imageview, if the image width is 50 and height is 50
    
    circleImageView.layer.cornerRadius = 25;
    //[[circleImageView layer] setCornerRadius:25.0];
    
    circleImageView.image = [self drawColorSetSize:circleImageView.frame.size setRed:0.0 setGreen:255.0 setBlue:0.0 setAlpha:1.0];
    
    //circleImageView.layer.masksToBounds = YES;
    
    //border Radius
    borderRadiusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 110, 100.0, 40.0)];
    
    //set UIImageView border thickness
    [[borderRadiusImageView layer] setBorderWidth:2.0];
    
    //set UIImageView border color
    [[borderRadiusImageView layer] setBorderColor:[UIColor blackColor].CGColor];
    
    //set UIImageView mask
    [[borderRadiusImageView layer] setMasksToBounds:YES];
    
    borderRadiusImageView.layer.cornerRadius = 10;
    
    borderRadiusImageView.image = [self drawColorSetSize:borderRadiusImageView.frame.size setRed:0.0 setGreen:0.0 setBlue:255.0 setAlpha:1.0];
    
    //Create bitmap-base graphic context
    //UIGraphicsBeginImageContext(paletteImageView.frame.size);
    //CGContextRef context = UIGraphicsGetCurrentContext();
    
    //UIColor *color = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    //CGContextSetFillColorWithColor(context, color.CGColor);
    //CGContextSetLineWidth(context, 4.0);
    //CGContextAddArc(context, 0.0, 0.0, 30, 0, 2 * PI, 0);
    //CGContextDrawPath(context, kCGPathFillStroke);
    //show the gradients by horizontal
    //CGContextDrawLinearGradient(context, gradient, CGPointMake(0.0, 0.0), CGPointMake(300.0, 0.0), 0);
    //show the gradients by Vertical
    //CGContextDrawLinearGradient(context, gradient, CGPointMake(200.0, 0.0), CGPointMake(0.0, 0.0), 0);
    
    //CGContextSaveGState(context);
    //show result
    //paletteImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //UIGraphicsEndImageContext();
    
    [self.view addSubview:paletteImageView];
    
    [self.view addSubview:circleImageView];
    
    [self.view addSubview:borderRadiusImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *) drawColorSetSize:(CGSize)size setRed:(float)red setGreen:(float)green setBlue:(float)blue setAlpha:(float)alpha {
    
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    UIColor *color = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
    [color setFill];
    //[[UIColor blackColor] setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
