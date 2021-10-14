//
//  NSBundle+CustomAlertBundle.m
//  CustomAlert
//
//  Created by Developer Pp on 2021/10/12.
//

#import "NSBundle+CustomAlertBundle.h"

@implementation NSBundle (CustomAlertBundle)

+ (NSBundle *)customAlertBundle{
    return [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"CustomFramework.framework/ImageBundle" ofType:@"bundle"]];
}
+ (UINib *)loadNibWithName:(NSString *)name {
    return [[[NSBundle customAlertBundle] loadNibNamed:name owner:nil options:nil] lastObject];
}

+ (UIImage *)imageName:(NSString *)name{
    return [UIImage imageNamed:name inBundle:[NSBundle customAlertBundle] compatibleWithTraitCollection:nil];
}

@end
