//
//  JLViewController.m
//  JLFloatingPanel
//
//  Created by Jacklin on 02/04/2020.
//  Copyright (c) 2020 Jacklin. All rights reserved.
//

#import "JLViewController.h"
#import <JLFloatingPanel-umbrella.h>
#import "JLSettingViewController.h"

@interface JLViewController ()<JLFloatingPanelControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) JLFloatingPanelController *settingPanelVC;

@end

@implementation JLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (IBAction)rightButtonClicked:(id)sender {
    if (self.settingPanelVC) return;
    // Initialize FloatingPanelController
    self.settingPanelVC = [[JLFloatingPanelController alloc] init];
    
    // Initialize FloatingPanelController and add the view
    self.settingPanelVC.surfaceView.cornerRadius = 6.0;
    self.settingPanelVC.surfaceView.shadowHidden = NO;
    self.settingPanelVC.isRemovalInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBackdropWithTapGesture:)];
    [self.settingPanelVC.backdropView addGestureRecognizer:tapGR];
    
    self.settingPanelVC.delegate = self;
    
    JLSettingViewController *contentVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([JLSettingViewController class])];
    contentVC = [[JLSettingViewController alloc] instance];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    // Set a content view controller
    [self.settingPanelVC setContentViewController:vc];
    
    //  Add FloatingPanel to self.view
    [self.settingPanelVC addPanelToParentViewController:self
                                              belowView:nil
                                               animated:YES];
    
}

- (void)handleBackdropWithTapGesture:(UITapGestureRecognizer *)tapGesture {
    if (tapGesture.view == self.settingPanelVC.view) {
        [self.settingPanelVC removePanelFromParentWithAnimated:YES completion:nil];
        self.settingPanelVC = nil;
    }
}

#pragma mark - JLFloatingPanelControllerDelegate
- (id<JLFloatingPanelLayout>)floatingPanelWithFpc:(JLFloatingPanelController *)fpc layoutForNewCollection:(UITraitCollection *)newCollection {
    if (fpc == self.settingPanelVC) {
        return [[JLFloatingPanelIntrinsicLayout alloc] init];
    }
    return nil;
}

- (BOOL)floatingPanelWithFpc:(JLFloatingPanelController *)fpc shouldRecognizeSimultaneouslyWithOtherGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return NO;
}

- (void)floatingPanelDidEndRemoveWithFpc:(JLFloatingPanelController *)fpc {
    if (fpc == self.settingPanelVC) {
        self.settingPanelVC = nil;
    }
}

- (BOOL)floatingPanelShouldBeginDraggingWithFpc:(JLFloatingPanelController *)fpc {
    return YES;
}

#pragma mark - UIStoryBoardDelegate
- (NSString *)storyboardName {
    return @"Main";
}

- (NSString *)identifier {
    return NSStringFromClass([self class]);
}

@end
