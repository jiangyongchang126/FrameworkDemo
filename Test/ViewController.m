//
//  ViewController.m
//  Test
//
//  Created by Developer Pp on 2021/10/14.
//

#import "ViewController.h"
#import <CustomFramework/HS_SelectValidTimeAlertView.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    NSArray *arr = @[
        @{@"name":@"全天有效",@"id":@"1001"},
        @{@"name":@"半天有效",@"id":@"1001"}

    ];
    HS_SelectValidTimeAlertView *alertV = [HS_SelectValidTimeAlertView selectValidTimeViewWithAllValidTypeData:arr];
    alertV.selectValidTime = ^(NSDictionary * _Nonnull selectValidTimeDic) {

        NSLog(@"%@",selectValidTimeDic);
    };
    [alertV showInView:self.view];
    // Do any additional setup after loading the view.
}


@end
