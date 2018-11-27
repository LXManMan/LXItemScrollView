//
//  ViewController.m
//  LXItemScrollView
//
//  Created by 漫漫 on 2018/11/27.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "LXItemScrollView.h"

@interface ViewController ()
@property (nonatomic ,strong)LXItemScrollView *scrollView1;
@property (nonatomic ,strong)LXItemScrollView *scrollView2;
@property (nonatomic ,strong)LXItemScrollView *scrollView3;
@property (nonatomic ,strong)LXItemScrollView *scrollView4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView1 = [[LXItemScrollView alloc]init];
    self.scrollView1.count = 1;

    [self.view addSubview:self.scrollView1];
    
    
    [self.scrollView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(FixH(59));
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(SafeAreaTopHeight);
    }];
    
    self.scrollView2 = [[LXItemScrollView alloc]init];
    
    self.scrollView2.count = 3;
    [self.view addSubview:self.scrollView2];
    
    
    [self.scrollView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(FixH(59));
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.scrollView1.mas_bottom).offset(30);
    }];
    
    self.scrollView3 = [[LXItemScrollView alloc]init];
    
    self.scrollView3.count = 4;

    [self.view addSubview:self.scrollView3];
    
    
    [self.scrollView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(FixH(59));
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.scrollView2.mas_bottom).offset(30);
    }];
    
    
    self.scrollView4 = [[LXItemScrollView alloc]init];
    self.scrollView4.count = 6;

    [self.view addSubview:self.scrollView4];
    
    
    [self.scrollView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(FixH(59));
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.scrollView3.mas_bottom).offset(30);
    }];
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
