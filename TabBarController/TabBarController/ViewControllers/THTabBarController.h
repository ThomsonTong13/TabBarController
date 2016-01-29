//
//  THTabBarController.h
//  TabBarController
//
//  Created by Thomson on 16/1/28.
//  Copyright © 2016年 Thomson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class THTabBarViewModel;

@interface THTabBarController : UITabBarController

@property (nonatomic, strong) THTabBarViewModel *viewModel;

- (instancetype)initWithViewModel:(THTabBarViewModel *)viewModel;

@end
