//
//  NSBundle+CustomAlertBundle.h
//  CustomAlert
//
//  Created by Developer Pp on 2021/10/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (CustomAlertBundle)

+ (NSBundle *)customAlertBundle;
+ (UINib *)loadNibWithName:(NSString *)name;
+ (UIImage *)imageName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
