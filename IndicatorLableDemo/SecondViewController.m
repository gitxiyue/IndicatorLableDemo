//
//  SecondViewController.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/10.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "SecondViewController.h"
#import "IndicatorLable.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    IndicatorLable *lab = [[IndicatorLable alloc] initWithFrame:CGRectMake(0, 80, SCREEN_W-10, 30) title:@"你有你的天地1" titleSize:14 titleColor:[UIColor purpleColor]];
    [lab setIndicatorColor:[UIColor blueColor] indicatorSize:CGSizeMake(16, 20)];
    [lab setTitleAlign:NSTextAlignmentRight indicatorAlign:LEFT];
    lab.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lab];
    __weak IndicatorLable *weak_lab = lab;
    [lab addActionBlock:^(id sender) {
        [XunUtils show:(weak_lab.title.text)];
    }];
    
    IndicatorLable *lab11 = [[IndicatorLable alloc]
                           initWithFrame:CGRectMake(0, 120, SCREEN_W-10, 30) title:@"你有你的天地2" titleSize:14 titleColor:[UIColor purpleColor]];
    [lab11 setIndicatorColor:[UIColor redColor] indicatorSize:CGSizeMake(4, 20)];
    [lab11 setTitleAlign:NSTextAlignmentLeft indicatorAlign:LEFT];
    lab11.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lab11];
    
    IndicatorLable *lab12 = [[IndicatorLable alloc]
                             initWithFrame:CGRectMake(0, 160, SCREEN_W-10, 30) title:@"你有你的天地3" titleSize:14 titleColor:[UIColor purpleColor]];
    [lab12 setIndicatorColor:[UIColor blueColor] indicatorSize:CGSizeMake(8, 20)];
    [lab12 setTitleAlign:NSTextAlignmentCenter indicatorAlign:LEFT];
    lab12.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lab12];
    
    
    
    
    
    IndicatorLable *lab2 = [[IndicatorLable alloc]
                           initWithFrame:CGRectMake(0, 200, SCREEN_W-10, 30) title:@"你有你的天地4" titleSize:16 titleColor:[UIColor purpleColor]];

    lab2.title.textAlignment = NSTextAlignmentLeft;
    [lab2 setIndicatorColor:[UIColor blueColor] indicatorSize:CGSizeMake(7, 16)];
    lab2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lab2];
    
    IndicatorLable *lab21 = [[IndicatorLable alloc]
                            initWithFrame:CGRectMake(0, 240, SCREEN_W-10, 30) title:@"你有你的天地5" titleSize:16 titleColor:[UIColor purpleColor]];
    lab21.title.textAlignment = NSTextAlignmentCenter;
    lab21.indicatorColor = [UIColor blueColor];
    lab21.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lab21];
    
    IndicatorLable *lab22 = [[IndicatorLable alloc]
                             initWithFrame:CGRectMake(0, 280, SCREEN_W-10, 30) title:@"你有你的天地6" titleSize:16 titleColor:[UIColor purpleColor]];
    lab22.title.textAlignment = NSTextAlignmentRight;
    //lab22.indicatorColor = [UIColor blueColor];
    lab22.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lab22];
    
    
    
    
    
    IndicatorLable *lab3 = [[IndicatorLable alloc]
                            initWithFrame:CGRectMake(0, 320, SCREEN_W-10, 30) title:@"你有你的天地7" titleSize:16 titleColor:[UIColor purpleColor]];
    lab3.backgroundColor = [UIColor orangeColor];
    [lab3 setIndicatorImage:[UIImage imageNamed:@"mini01.jpg"] indicatorSize:CGSizeMake(16, 16)];
    lab3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lab3];
    
    IndicatorLable *lab4 = [[IndicatorLable alloc]
                            initWithFrame:CGRectMake(0, 360, SCREEN_W-10, 30) title:@"你有你的天地8" titleSize:16 titleColor:[UIColor purpleColor]];
    lab4.backgroundColor = [UIColor orangeColor];
    [lab4 setIndicatorImage:[UIImage imageNamed:@"mini01.jpg"] indicatorSize:CGSizeMake(18, 18)];
    lab4.title.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:lab4];
    
    IndicatorLable *lab5 = [[IndicatorLable alloc]
                            initWithFrame:CGRectMake(0, 400, SCREEN_W, 30) title:@"你有你的天地9" titleSize:16 titleColor:[UIColor purpleColor]];
    lab5.backgroundColor = [UIColor orangeColor];
    [lab5 setIndicatorImage:[UIImage imageNamed:@"mini01.jpg"] indicatorSize:CGSizeMake(20, 20)];
    lab5.title.textAlignment = NSTextAlignmentCenter;
    lab5.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lab5];
    
    IndicatorLable *lab6 = [[IndicatorLable alloc]
                            initWithFrame:CGRectMake(0, 440, SCREEN_W, 30) title:@"你有你的天地10" titleSize:16 titleColor:[UIColor purpleColor]];
    lab6.backgroundColor = [UIColor orangeColor];
    [lab6 setIndicatorImage:[UIImage imageNamed:@"mini01.jpg"] indicatorSize:CGSizeMake(24, 24)];
    [lab6 setTitleAlign:NSTextAlignmentCenter indicatorAlign:CENTER];
    [self.view addSubview:lab6];
//    [lab6 makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(lab5.bottom).offset(8);
//        make.left.equalTo(0);
//        //make.right.equalTo(0);
//        //大于 小于  不会自动，有会的大神交流下
//        make.height.greaterThanOrEqualTo(30);
//        make.width.greaterThanOrEqualTo(300);
//    }];
    __weak IndicatorLable *weak_lab6 = lab6;
    [lab6 addActionBlock:^(id sender) {
        [XunUtils show:(weak_lab6.title.text)];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
