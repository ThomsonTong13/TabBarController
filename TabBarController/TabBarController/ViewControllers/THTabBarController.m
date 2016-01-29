//
//  THTabBarController.m
//  TabBarController
//
//  Created by Thomson on 16/1/28.
//  Copyright © 2016年 Thomson. All rights reserved.
//

#import "THTabBarController.h"
#import "THOneViewController.h"
#import "THTwoViewController.h"
#import "THThreeViewController.h"
#import "THFourViewController.h"

#import "THTabBarViewModel.h"
#import "THUtils.h"

@interface THTabBarController ()

// TabBarItem标题数组
@property (nonatomic, strong) NSArray *titlesArray;
// TabBarItem未选中图片数组
@property (nonatomic, strong) NSArray *imagesArray;
// TabBarItem选中之后的图片数组
@property (nonatomic, strong) NSArray *selectedImagesArray;

@property (nonatomic, strong) UIViewController *willSelectedController;

@end

@implementation THTabBarController

#pragma mark - life cycle

- (instancetype)initWithViewModel:(THTabBarViewModel *)viewModel
{
    _viewModel = viewModel;

    return [super init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.titlesArray = self.viewModel.titles;
    self.imagesArray = self.viewModel.images;
    self.selectedImagesArray = self.viewModel.selectedImages;

    UIImage *image = [UIImage imageNamed:self.viewModel.backgroundImage];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height / 2 - 0.1,
                                                                image.size.width / 2 - 0.1,
                                                                image.size.height / 2 - 0.1,
                                                                image.size.width / 2 - 0.1)];
    self.tabBar.layer.contents = (id)image.CGImage;

    [self initializerControllers];
}

#pragma mark - private methods

- (void)initializerControllers
{
    UINavigationController *navOne = [[UINavigationController alloc] initWithRootViewController:[[THOneViewController alloc] init]];

    UINavigationController *navTwo = [[UINavigationController alloc] initWithRootViewController:[[THTwoViewController alloc] init]];

    UINavigationController *navThree = [[UINavigationController alloc] initWithRootViewController:[[THThreeViewController alloc] init]];

    UINavigationController *navFour = [[UINavigationController alloc] initWithRootViewController:[[THFourViewController alloc] init]];

    // 给TabBar装载控制器
    self.viewControllers = [NSArray arrayWithObjects:
                            navOne,
                            navTwo,
                            navThree,
                            navFour, nil];

    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.barTintColor = [UIColor whiteColor];

    // 设置每个TabBarItem的图片和文字
    for (int index = 0; index < [self.viewControllers count]; index ++)
    {
        UIViewController *viewController = self.viewControllers[index];

        UIImage *image = [UIImage imageNamed:_imagesArray[index]];

        viewController.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        image = [UIImage imageNamed:_selectedImagesArray[index] inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];

        viewController.tabBarItem.selectedImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        viewController.tabBarItem.title = _titlesArray[index];
        viewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);

        [viewController.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName:[THUtils HexColorToRedGreenBlue:@"#fb9c41"] }
                                                 forState:UIControlStateSelected];
    }
}

@end
