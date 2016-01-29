//
//  THTabBarViewModel.m
//  TabBarController
//
//  Created by Thomson on 16/1/28.
//  Copyright © 2016年 Thomson. All rights reserved.
//

#import "THTabBarViewModel.h"

@interface THTabBarViewModel ()

@property (nonatomic, strong, readwrite) NSArray *titles;
@property (nonatomic, strong, readwrite) NSArray *images;
@property (nonatomic, strong, readwrite) NSArray *selectedImages;

@property (nonatomic, strong, readwrite) NSString *backgroundImage;

@end

@implementation THTabBarViewModel

- (instancetype)init
{
    self = [super init];

    if (self)
    {
        self.titles = @[ @"发现",
                         @"活动",
                         @"信息",
                         @"我的",
                         ];

        self.images = @[ @"tab_discover",
                         @"tab_activity",
                         @"tab_chat",
                         @"tab_moment"
                         ];

        self.selectedImages = @[ @"tab_discover_pressed",
                                 @"tab_activity_pressed",
                                 @"tab_chat_pressed",
                                 @"tab_moment_pressed"
                                 ];

        self.backgroundImage = @"tab_bg";
    }

    return self;
}

@end
