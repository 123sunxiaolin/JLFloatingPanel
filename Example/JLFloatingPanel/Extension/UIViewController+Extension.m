//
//  UIViewController+Extension.m
//  gh-mall
//
//  Created by Jacklin on 2020/1/5.
//  Copyright © 2020 Mall. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (instancetype)instance {
    if ([self conformsToProtocol:@protocol(UIStoryBoardDelegate)]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[(id <UIStoryBoardDelegate>)self storyboardName]
                                                             bundle:nil];
        UIViewController *instance = [storyboard instantiateViewControllerWithIdentifier:[(id <UIStoryBoardDelegate>)self identifier]];
        if (!instance) {
            NSLog(@"instance is nil");
        }
        return instance;
    }
    return self;
}

@end
