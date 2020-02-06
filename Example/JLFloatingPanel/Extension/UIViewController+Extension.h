//
//  UIViewController+Extension.h
//  gh-mall
//
//  Created by Jacklin on 2020/1/5.
//  Copyright © 2020 Mall. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIStoryBoardDelegate <NSObject>

@optional
- (NSString *)storyboardName;
- (NSString *)identifier;

@end

@interface UIViewController (Extension)

- (instancetype)instance;

@end

