//
//  GHBaseViewController.m
//  gh-mall
//
//  Created by Jacklin on 2020/1/7.
//  Copyright © 2020 Mall. All rights reserved.
//

#import "JLBaseViewController.h"

@interface JLBaseViewController ()

@end

@implementation JLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UIStoryBoarDelegate
- (NSString *)storyboardName {
    return @"";
}

- (NSString *)identifier {
    return NSStringFromClass([self class]);
}


@end
