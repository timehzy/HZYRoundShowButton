//
//  ViewController.m
//  HZYRoundShowButton
//
//  Created by Michael-Nine on 16/8/2.
//  Copyright © 2016年 Michael. All rights reserved.
//

#import "ViewController.h"
#import "HZYRoundShowButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
    [btn1 setTitle:@"1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(aa) forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor = [UIColor greenColor];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
    [btn2 setTitle:@"2" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor grayColor];

    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
    [btn3 setTitle:@"3" forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor purpleColor];

    UIButton *btn4 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
    [btn4 setTitle:@"4" forState:UIControlStateNormal];
    btn4.backgroundColor = [UIColor orangeColor];


    HZYRoundShowButton *roundBtn = [HZYRoundShowButton roundShowButton:@[btn1, btn2, btn3, btn4] andRadius:72 andSize:CGSizeMake(48, 48) andPosition:self.view.center];
    roundBtn.arcLength = M_PI;
    roundBtn.startAngle = M_PI / 4;
    roundBtn.roundButton = YES;
    [self.view addSubview:roundBtn];
}

- (void)aa{
    NSLog(@"hhh");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
