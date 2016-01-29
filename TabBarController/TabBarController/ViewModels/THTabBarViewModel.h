//
//  THTabBarViewModel.h
//  TabBarController
//
//  Created by Thomson on 16/1/28.
//  Copyright © 2016年 Thomson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THTabBarViewModel : NSObject

@property (nonatomic, strong, readonly) NSArray *titles;
@property (nonatomic, strong, readonly) NSArray *images;
@property (nonatomic, strong, readonly) NSArray *selectedImages;

@property (nonatomic, strong, readonly) NSString *backgroundImage;

@end
