//
//  ViewController.m
//  UIStackViewDemo
//
//  Created by YueWen on 2018/4/27.
//  Copyright © 2018年 YueWen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIStackView *stackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.stackView = ({
        
        UIStackView *stack = [UIStackView new];
        
        stack.spacing = 5;
        
        /** 主轴的方向，就是排列的方向 **/
        
        stack.axis = UILayoutConstraintAxisVertical;//纵向
        stack.axis = UILayoutConstraintAxisHorizontal;//横向
        
        
        /**  填充方式 **/
        
        
        //将stackView充满
        //比如label,不管文字多少，将大小按照设置的非主轴方向充满
        //ex: Vertical 就是水平铺满
        stack.alignment = UIStackViewAlignmentFill;
        
        //在Vertical方向上生效，表示左对齐
        //比如label,文字自适应，如果小于非主轴方向的宽度，将不充满
        stack.alignment = UIStackViewAlignmentLeading;
        
        //在Horizontal方向上生效，表示左对齐
        //比如label,文字自适应，如果小于非主轴方向的高度，将不充满
        //本质UIStackViewAlignmentTop = UIStackViewAlignmentLeading
        stack.alignment = UIStackViewAlignmentTop;
        
        //在Vertical方向上生效，表示右对齐
        //比如label,文字自适应，如果小于非主轴方向的宽度，将不充满
        stack.alignment = UIStackViewAlignmentTrailing;
        
        //在Horizontal方向上生效，表示右对齐
        //比如label,文字自适应，如果小于非主轴方向的高度，将不充满
        //本质UIStackViewAlignmentBottom = UIStackViewAlignmentTrailing
        stack.alignment = UIStackViewAlignmentBottom;
        
        //仅限于Horizontal
        //按照最高的一个视图的bottom对齐，最高的视图top对齐
        stack.alignment = UIStackViewAlignmentLastBaseline;
        
        //中心对齐
        //不充满，沿主轴方向中心对齐
        stack.alignment = UIStackViewAlignmentCenter;
        
        
        /** 布局方式 **/
        
        //Horizontal：所有的布局视图一共的宽度为UIStackView的高度
        //Vertical: 所有的布局视图一共的高度为UIStackView的高度
        //子视图的大小必须通过autolayout进行设置，优先级低的视图优先被拉伸
        stack.distribution = UIStackViewDistributionFill;
        
        //平均分配分布
        stack.distribution = UIStackViewDistributionFillEqually;
        
        //根据子视图的原始大小比例进行压缩，到达UIStackViewDistributionFill效果
        stack.distribution = UIStackViewDistributionFillProportionally;
        
        //根据原始子视图的大小进行布局，子视图之间的间距相同
        stack.distribution = UIStackViewDistributionEqualSpacing;
        
        //根据原始子视图的大小进行布局，子视图的中心点之间的间距相同
        stack.distribution = UIStackViewDistributionEqualCentering;
        
        stack;
    });
    
    
    UILabel *first = ({
        
        UILabel *view = [UILabel new];
        view.backgroundColor = UIColor.orangeColor;
        view.text = @"骄傲骄傲骄傲家具啊骄傲骄傲骄傲家具啊";
        view.numberOfLines = 0;
        view.frame = CGRectMake(0, 0, 200, 150);//设置大小是无效滴,设置大小请使用autoLayout
        view;
    });
    
    UILabel *second = ({
        
        UILabel *view = [UILabel new];
        view.backgroundColor = UIColor.yellowColor;
        view.text = @"渐入佳境软件软件软件软件进入将软件软件进入进入进入将软件软件进入进入金融界人家进入进入";
        view.numberOfLines = 0;
        view;
    });
    
    
    UILabel *third = ({
        
        UILabel *view = [UILabel new];
        view.backgroundColor = UIColor.greenColor;
        view.text = @"哈哈哈哈";
        view.numberOfLines = 0;
        view.frame = CGRectMake(0, 0, 100, 150);//设置大小是无效滴,设置大小请使用autoLayout
        view;
    });
    
    

    
    
    [self.view addSubview:self.stackView];
    [self.stackView addArrangedSubview:first];
    [self.stackView addArrangedSubview:second];
    [self.stackView addArrangedSubview:third];
    
    if (self.stackView.distribution == UIStackViewDistributionFill) {
        
        //设置first的约束
        NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:first attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200];
        
        NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:first attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
        
        [self.stackView addConstraint:width];
        [self.stackView addConstraint:height];
    }

    self.stackView.frame = self.view.bounds;
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    self.stackView.bounds = self.view.bounds;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
