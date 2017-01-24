//
//  ViewController.m
//  ce
//
//  Created by 陈灿良Ruth on 16/7/22.
//  Copyright © 2016年 Ruth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIButton * chooseBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 120)];
    bgView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bgView];
    for (int i = 0; i<2; i++) {
        
        UIView * tapView = [[UIView alloc]init];
        [bgView addSubview:tapView];
        [tapView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.leading.equalTo(bgView).with.offset(0);
            make.top.equalTo(bgView).with.offset(i*60);
            make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, 60));
        }];
        NSArray * logoImgArr = @[@"alip@2x",@"wech@2x"];
        NSArray * nameArr = @[@"支付宝支付",@"微信支付"];
        //NSArray * subTitleArr = @[@"推荐有支付宝账户的使用",@"推荐有微信账户的使用"];
        self.chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.chooseBtn.backgroundColor = [UIColor redColor];
        [bgView addSubview:self.chooseBtn];
        self.chooseBtn.tag = 100 + i;
        if (i == 0) {
            self.chooseBtn.selected = YES;
        }
        [self.chooseBtn setImage:[UIImage imageNamed:@"否@3x"] forState:UIControlStateNormal];
        [self.chooseBtn setImage:[UIImage imageNamed:@"是@3x"] forState:UIControlStateSelected];
        [self.chooseBtn addTarget:self action:@selector(styleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.leading.equalTo(bgView).with.offset(10);
            make.top.equalTo(bgView).with.offset(22 + i*65);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        UIImageView * logoImg = [[UIImageView alloc]init];
        [bgView addSubview:logoImg];
        [logoImg setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",logoImgArr[i]]]];
        [logoImg mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.leading.equalTo(self.chooseBtn.mas_trailing).with.offset(20);
            make.top.equalTo(bgView).with.offset(22 + i*65 - 12);
            make.size.mas_equalTo(CGSizeMake(35, 35));
        }];
        
        //支付名称
        UILabel * nameLabel = [[UILabel alloc]init];
        [bgView addSubview:nameLabel];
        nameLabel.text = nameArr[i];
        nameLabel.textColor = [UIColor colorWithWhite:0.298 alpha:1.000];
        nameLabel.font = [UIFont systemFontOfSize:13];
        //        nameLabel.backgroundColor = [UIColor redColor];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.leading.equalTo(logoImg.mas_trailing).with.offset(15);
            make.top.equalTo(bgView).with.offset(22 + i*65 - 15);
            make.size.mas_equalTo(CGSizeMake(100, 20));
        }];
    }
        
}
- (void)styleBtnClick:(UIButton *)button{
    if (button.tag == 100) {
        UIButton * btn = [self.view viewWithTag:101];
        btn.selected = NO;
        button.selected = YES;
        NSLog(@"zhi");
    }else{
        UIButton * btn = [self.view viewWithTag:100];
        btn.selected = NO;
        button.selected = YES;
        NSLog(@"wei");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
