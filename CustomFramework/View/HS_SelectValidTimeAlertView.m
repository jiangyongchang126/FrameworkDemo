//
//  HS_SelectValidTimeAlertView.m
//  llcb
//
//  Created by Developer Pp on 2021/9/18.
//  Copyright © 2021 pp. All rights reserved.
//

#import "HS_SelectValidTimeAlertView.h"
#import "HS_InviteChooseTimeV.h"
#import "UIView+QQFrame.h"

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define WEAKSELF typeof(self) __weak weakSelf = self;

@interface HS_SelectValidTimeAlertView ()<HS_InviteChooseTimeVDelegate>
@property(nonatomic, strong) HS_InviteChooseTimeV *coverView;
@property(nonatomic, assign) CGFloat coverHeight;
@property(nonatomic, strong) NSArray *typeArr;
@end

@implementation HS_SelectValidTimeAlertView


+ (instancetype)selectValidTimeViewWithAllValidTypeData:(NSArray *)typeArr{
    HS_SelectValidTimeAlertView *shareCustomView = [[HS_SelectValidTimeAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds withArr:typeArr];
    return shareCustomView;
}

- (instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)typeArr{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        self.typeArr = typeArr;
        [self updataSubViews];
    }
    return self;
}

- (void)updataSubViews{
    UIControl *touch = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    [touch addTarget:self action:@selector(touchDownAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:touch];
    
    CGFloat viewWidth = 280;
    self.coverHeight = 65 + self.typeArr.count * 60 +90 + 30 +28;
    self.coverView = [[HS_InviteChooseTimeV alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-viewWidth)/2, (SCREEN_HEIGHT - self.coverHeight)/2, viewWidth, self.coverHeight)];
    self.coverView.dataArr = self.typeArr;
    self.coverView.delegate = self;

    self.coverView.alpha = 0;
    [self addSubview:self.coverView];
    [self.coverView.closeButton addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark ---------选择有效时间确定按钮事件-------------
- (void)clickToChooseTheType:(NSDictionary *)typeDict{
    
    if (self.selectValidTime) {
        self.selectValidTime(typeDict);
    }
    [self dismiss];
}


// 点击屏幕关闭弹窗
- (void)touchDownAction {
//    [self dismiss];
}

// 关闭弹窗
- (void)closeAction {
    [self dismiss];
}

// 从中间由小变大弹出动画
- (void)delayMethod{
    
    CGAffineTransform newTransform =
    CGAffineTransformScale(self.coverView.transform, 0.1, 0.1);
    [self.coverView setTransform:newTransform];
    self.coverView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    [self performSelector:@selector(imageViewControllerBigAnimation)];
}

- (void)imageViewControllerBigAnimation{
   
    [UIView beginAnimations:@"imageViewBig" context:nil];
    [UIView setAnimationDuration:0.3];
    CGAffineTransform newTransform = CGAffineTransformConcat(self.coverView.transform,  CGAffineTransformInvert(self.coverView.transform));
    [self.coverView setTransform:newTransform];
    self.coverView.alpha = 1.0;
    self.coverView.center = CGPointMake(SCREEN_WIDTH/2, (SCREEN_HEIGHT)/2);
    [UIView commitAnimations];
   
}

// 弹出
- (void)showInView:(UIView *)view {
    [view addSubview:self];
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05/*延迟执行时间*/ * NSEC_PER_SEC));
    WEAKSELF
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [weakSelf delayMethod];
    });
}

// 关闭弹窗
- (void)dismiss {
    [UIView animateWithDuration:.2
                     animations:^{
                         self.coverView.frame = CGRectMake((SCREEN_WIDTH-280)/2, self.height, 280, self.coverHeight);
                         // 避免闪屏
                         self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];

                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
