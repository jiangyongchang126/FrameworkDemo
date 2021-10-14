//
//  HS_InviteChooseTimeV.h
//  llcb
//
//  Created by Developer Pp on 2021/9/18.
//  Copyright © 2021 pp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HS_InviteChooseTimeVDelegate<NSObject>

@optional

- (void)clickToChooseTheType:(NSDictionary *)typeDict;

@end

@interface HS_InviteChooseTimeV : UIView

@property(nonatomic,strong)UIView *coverView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *clickBtn;
@property(nonatomic,strong)UIButton *closeButton;

@property(nonatomic,strong)NSArray *dataArr;

@property(nonatomic,weak)id<HS_InviteChooseTimeVDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
