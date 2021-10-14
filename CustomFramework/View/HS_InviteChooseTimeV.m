//
//  HS_InviteChooseTimeV.m
//  llcb
//
//  Created by Developer Pp on 2021/9/18.
//  Copyright © 2021 pp. All rights reserved.
//

#import "HS_InviteChooseTimeV.h"
#import "SelectTypeCell.h"
#import "NSBundle+CustomAlertBundle.h"
#import "UIView+QQFrame.h"

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface HS_InviteChooseTimeV ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSIndexPath *currentIndexPath;

@end

@implementation HS_InviteChooseTimeV

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self layoutUI];
        [self updataSubViews];
    }
    return self;
}

- (void)updataSubViews{
    
    CGFloat left = 20;
    CGFloat top = 20;
    CGFloat viewWidth = self.width;
    CGFloat TableHeight = self.height-90-30-28-65;
    
    self.coverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewWidth, self.height-30-28)];
    self.coverView.backgroundColor = [UIColor whiteColor];
    self.coverView.layer.cornerRadius = 10;
    self.coverView.layer.masksToBounds = YES;
    [self addSubview:self.coverView];
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(left, top, viewWidth-2*left, 25)];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.text = @"请选择有效时间";
    titleLab.font = [UIFont boldSystemFontOfSize:16];
    titleLab.textColor = [UIColor blackColor];
    [self.coverView addSubview:titleLab];
    
    CGFloat topY = top + 25 + 20;
    

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topY, viewWidth, TableHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SelectTypeCell" bundle:[NSBundle customAlertBundle]] forCellReuseIdentifier:@"SelectTypeCell"];
    [self.coverView addSubview:self.tableView];
    
    topY  += TableHeight + 15;
           
    UIButton *shareBtn = [[UIButton alloc]initWithFrame:CGRectMake(left, topY, viewWidth-2*left, 45)];
    shareBtn.backgroundColor = RGBA(83, 129, 255, 1);
    
    shareBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [shareBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [shareBtn setTitle:@"确 定" forState:UIControlStateNormal];
    
    shareBtn.layer.cornerRadius = 45/2;
    shareBtn.layer.masksToBounds = YES;
    [shareBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.clickBtn = shareBtn;
    [self.coverView addSubview:self.clickBtn];
       
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [closeButton setImage:[UIImage imageNamed:@"hs_choose_type_close" inBundle:[NSBundle customAlertBundle] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake((viewWidth-28)/2, self.height-30, 28, 28);
    self.closeButton = closeButton;
    [self addSubview:self.closeButton];
}

-(void)setDataArr:(NSArray *)dataArr{
    _dataArr = dataArr;
    [self.tableView reloadData];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SelectTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelectTypeCell" forIndexPath:indexPath];

    if (_dataArr.count > 0) {
        NSDictionary *dic = _dataArr[indexPath.row];
        NSString *title = [dic objectForKey:@"name"];
        cell.titleLab.text = title;
        if (self.currentIndexPath && (self.currentIndexPath == indexPath)) {
            cell.imageView.image = [NSBundle imageName:@"hs_choose_type_selected"];
        }else{
            cell.imageView.image = [NSBundle imageName:@"hs_choose_type_unselect"];
        }
        
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.currentIndexPath = indexPath;
    [self.tableView reloadData];
}

- (void)clickBtnAction:(UIButton *)sender{
    
    if (self.currentIndexPath) {
        NSDictionary *dic = _dataArr[self.currentIndexPath.row];
        if ([self.delegate respondsToSelector:@selector(clickToChooseTheType:)]) {
            [self.delegate clickToChooseTheType:dic];
        }
        
    }else{
        
//        [MBProgressHUD showError:@"请选择有效时间" toView:self.superview];

    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
