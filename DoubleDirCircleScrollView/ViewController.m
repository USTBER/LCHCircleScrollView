//
//  ViewController.m
//  DoubleDirCircleScrollView
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "LCHCircleCell.h"
#import "LCHCircleView.h"

@interface ViewController ()
<LCHCircleViewDataSource>

@property (nonatomic, strong) LCHCircleView *circleView;

@end

@implementation ViewController


#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.circleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - overWrite

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
}

#pragma mark - LCHCircleViewDataSource 

- (NSUInteger)numberOfCircleCellInCircleView:(LCHCircleView *)circleView {
    
    return 8;
}

- (LCHCircleCell *)circleView:(LCHCircleView *)circleView cellIndex:(NSUInteger)index {
    
    LCHCircleCell *cell = [[LCHCircleCell alloc] init];
    cell.label.text = [NSString stringWithFormat:@"%lu", (unsigned long)index];

    return cell;
}

#pragma mark - lazy loading

- (LCHCircleView *)circleView {
    
    if (_circleView) {
        
        return _circleView;
    }
    _circleView = [[LCHCircleView alloc] initWithType:LCHCircleViewTypeBackwardAutomatic scrollDirection:LCHCircleViewScrollDirectionHorizon frame:self.view.bounds];
    _circleView.dataSource = self;
    
    return _circleView;
}

@end
