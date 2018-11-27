
//
//  LXItemScrollView.m
//  TestDemo
//
//  Created by 漫漫 on 2018/11/27.
//  Copyright © 2018年 万众创新. All rights reserved.
//

#import "LXItemScrollView.h"
#import "LXScrollViewItem.h"
@interface LXItemScrollView()
@property (strong, nonatomic) UIScrollView* scrollView;
@property (strong, nonatomic) UIView* contentView;

@end
@implementation LXItemScrollView

-(instancetype)init{
    self = [super init];
    if (self) {
        
        UIScrollView *scrollView = UIScrollView.new;
        self.scrollView = scrollView;
        
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:scrollView];
       
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        self.count = 5;
    }
    return self;
}
-(void)setCount:(NSInteger)count{
    _count  = count;
    
    [self generateContent];
    
}
- (void)generateContent {
   
    
    [self.contentView removeFromSuperview];
    
    //scrollView 需要一个撑满的容器
    UIView* contentView = UIView.new;
    
    [self.scrollView addSubview:contentView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.height.equalTo(self.scrollView);
    }];
    
    self.contentView = contentView;
   
    LXScrollViewItem *lastButton = nil;
    
    
    CGFloat totalWidth = FixW(30);
    
    CGFloat space = FixW(30);
    
    for (int i = 0; i < self.count; i++) {
        LXScrollViewItem *view = [[LXScrollViewItem alloc]init];
        
        view.backgroundColor = [UIColor whiteColor];
        
        [_contentView addSubview:view];
        
        view.icon.image = [UIImage imageNamed:@"头像"];
        
        NSString *str = @"忒修斯";
        
        view.textLabel.text = str;
        
        //计算宽度
        CGFloat width = [str sizeWithFont:[UIFont systemFontOfSize:11 weight:UIFontWeightMedium] maxSize:CGSizeMake(CGFLOAT_MAX, FixH(13))].width;
        
        if (width <= FixW(32)) {
            
            width = FixW(32);
            
        }
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(0);
            if (!lastButton) {
                make.left.mas_equalTo(space);
            }else{
                make.left.mas_equalTo(lastButton.mas_right).offset(space);
            }
            make.width.mas_equalTo(width);
            make.height.equalTo(self.contentView);
        }];
        
        totalWidth += (width + space);
        
        lastButton = view;
    }

    //容器右侧根据子视图确定
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(lastButton.mas_right).offset(space);
    }];
    
    
    //限制滚动，设置内容区域
    if (totalWidth >= kScreenWidth - space) {
        self.scrollView.scrollEnabled = YES;
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kScreenWidth - space);
        }];
    }else{
        self.scrollView.scrollEnabled = NO;
        
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(totalWidth);
        }];
    }
    
}

@end
