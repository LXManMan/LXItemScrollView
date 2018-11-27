
//
//  LXScrollViewItem.m
//  TestDemo
//
//  Created by 漫漫 on 2018/11/27.
//  Copyright © 2018年 万众创新. All rights reserved.
//

#import "LXScrollViewItem.h"
@interface LXScrollViewItem()


@end
@implementation LXScrollViewItem
-(instancetype)init{
    self = [super init];
    if (self) {
        
        
        self.icon =[[UIImageView alloc]init];
        [self addSubview:self.icon];
        self.textLabel =[[UILabel alloc]init];
        self.textLabel.font = [UIFont systemFontOfSize:11 weight:UIFontWeightMedium];
        [self addSubview:self.textLabel];
        
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.textColor = UIColorHexFromRGB(0x7A7B7D);
        
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(FixH(5));
            make.size.mas_equalTo(CGSizeMake(FixH(32), FixH(32)));
        }];
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(-FixH(5));
           

        }];
    }
    return self;
}

@end
