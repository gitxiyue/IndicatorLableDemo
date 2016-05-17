# IndicatorLableDemo
带有指示器【图标】的的Lable

![image](https://github.com/gitxiyue/IndicatorLableDemo/blob/master/Screen1.png)

###封装了点击事件
	
	// - (void)addActionBlock:(void (^)(id sender))block
    [lab addActionBlock:^(id sender) {
      //to do;
    }];



###用法

    IndicatorLable *lab = [[IndicatorLable alloc]
                            initWithFrame:CGRectMake(0, 440, SCREEN_W, 30) 
                            title:@"你有你的天地10" titleSize:16 
                            titleColor:[UIColor purpleColor]];
    [lab setIndicatorImage:[UIImage imageNamed:@"mini01.jpg"] indicatorSize:CGSizeMake(24, 24)];
    [lab setTitleAlign:NSTextAlignmentCenter indicatorAlign:CENTER];
    [self.view addSubview:lab];

####更多用法看demo
