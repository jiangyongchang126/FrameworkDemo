//
//  HS_SelectValidTimeAlertView.h
//  llcb
//
//  Created by Developer Pp on 2021/9/18.
//  Copyright © 2021 pp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ClickSelectValidTimeAction)(NSDictionary *selectValidTimeDic);

@interface HS_SelectValidTimeAlertView : UIView

+ (instancetype)selectValidTimeViewWithAllValidTypeData:(NSArray *)typeArr;
- (void)showInView:(UIView *)view;

@property(nonatomic,copy)ClickSelectValidTimeAction selectValidTime;

@end

NS_ASSUME_NONNULL_END
