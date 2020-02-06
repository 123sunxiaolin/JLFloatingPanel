//
//  JLSettingViewController.m
//  JLFloatingPanel_Example
//
//  Created by Jacklin on 2020/2/4.
//  Copyright © 2020 Jacklin. All rights reserved.
//

#import "JLSettingViewController.h"

@interface JLSettingViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *largeTitlesSwicth;
@property (weak, nonatomic) IBOutlet UISwitch *translucentSwicth;
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation JLSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UIStoryBoardDelegate
- (NSString *)storyboardName {
    return @"Main";
}

- (NSString *)identifier {
    return NSStringFromClass([self class]);
}

@end
