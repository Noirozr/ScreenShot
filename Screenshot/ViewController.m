//
//  ViewController.m
//  Screenshot
//
//  Created by Noirozr on 15/9/27.
//  Copyright © 2015年 Yongjia Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];

}
- (IBAction)getShot:(id)sender {
    double scale = [[UIScreen mainScreen] scale];
    
    UIImage *shot = nil;
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, scale);
    {
        if ([self.view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
            [self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:YES];
        } else {
            [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        }
        
        shot = UIGraphicsGetImageFromCurrentImageContext();
    
    }
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:shot];
    self.view = imageView;
    NSLog(@"Image Saved!\n");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
