//
//  ViewController.m
//  LMProgressView
//
//  Created by cbd on 16/3/2.
//  Copyright © 2016年 com.CBD.furniture. All rights reserved.
//

#import "ViewController.h"
#import "LMProgressView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containView;

@property (nonatomic, strong)LMProgressView *progressView;

@property (assign, nonatomic)__block BOOL isEnd;

- (IBAction)startOnclick:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_containView addSubview:self.progressView];
    
    _isEnd = YES;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (float i = 0; i < 99 ; i++) {
            usleep(500000);
            if( i ==  11) {
                [self startOnclick:nil];
            }
        }
    });
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - GET方法
- (LMProgressView *)progressView {
    if(!_progressView) {
        _progressView = [[LMProgressView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_containView.frame), CGRectGetHeight(_containView.frame))];
    }
    return _progressView;
}

#pragma mark - 事件
- (IBAction)startOnclick:(UIButton *)sender {
    if(_isEnd) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            _isEnd = NO;
            for (float i = 0; i < 1.0 ; i += 0.01) {
                usleep(50000);
                dispatch_async(dispatch_get_main_queue(), ^{
                    _progressView.progress = i;
                });
            }
            _isEnd = YES;
        });
    }
}

@end
