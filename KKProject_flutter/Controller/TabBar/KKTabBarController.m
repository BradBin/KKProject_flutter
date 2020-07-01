//
//  KKTabBarController.m
//  KKProject_flutter
//
//  Created by youbin on 2020/7/1.
//  Copyright © 2020 youbin. All rights reserved.
//

#import "KKTabBarController.h"

#import "KKHomeViewController.h"
#import "KKTrendsViewController.h"
#import "KKMessageViewController.h"
#import "KKProfileViewController.h"

@interface KKTabBarController ()<UITabBarControllerDelegate,
CYLTabBarControllerDelegate>

@end

@implementation KKTabBarController

- (instancetype)init
{
    UIEdgeInsets imageInsets = UIEdgeInsetsZero;
    UIOffset titleOffset     = UIOffsetMake(0, -1.0);
    self = [super initWithViewControllers:[self tabBarControllers]
                    tabBarItemsAttributes:[self tabBarItems]
                              imageInsets:imageInsets
                  titlePositionAdjustment:titleOffset];
    if (self) {
        [self customizeTabBarItemWithTitleOffset:titleOffset];
        self.delegate = self;
        self.navigationController.navigationBar.hidden = true;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark -自定义Item样式
-(void)customizeTabBarItemWithTitleOffset:(UIOffset)titleOffset{
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = UIColor.blackColor;
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = UIColor.redColor;
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    if (@available(iOS 13.0, *)) {
        [self hideTabBarShadowImageView];
        UITabBarItemAppearance *appearance = [[UITabBarItemAppearance  alloc] init];
        appearance.normal.titlePositionAdjustment = titleOffset;
        [appearance.normal setTitleTextAttributes:normalAttrs];
        [appearance.selected setTitleTextAttributes:selectedAttrs];
        UITabBarAppearance *standardAppearance = [[UITabBarAppearance alloc] init];
        standardAppearance.stackedLayoutAppearance = appearance;
        standardAppearance.backgroundColor = [UIColor cyl_systemBackgroundColor];
        self.tabBar.standardAppearance = standardAppearance;
    } else {
        UITabBarItem *tabBar = [UITabBarItem appearance];
        [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
        [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    }
}

#pragma mark -UITabBarControllerDelegate
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    BOOL flag = true;
    UIControl *selectedItem = [viewController.tabBarItem cyl_tabButton];
    if (selectedItem.selected) {
        @try {
            NSLog(@"************\n%@\n************\n",[[self class] cyl_topmostViewController]);
            [[[self class] cyl_topmostViewController] performSelector:@selector(kk_refresh)];
        } @catch (NSException *exception) {
             NSLog(@"🔴类名与方法名：%@（在第%@行），描述：%@", @(__PRETTY_FUNCTION__), @(__LINE__), exception.reason);
        } @finally {
            NSLog(@"上报信息");
        }
    }
    return flag;
}



#pragma mark -CYLTabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control{
    
}


-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
}

#pragma mark -ViewControllers
-(NSArray<UIViewController *> *)tabBarControllers{
    KKHomeViewController    *homeVC    = KKHomeViewController.new;
    KKTrendsViewController *actVC    = KKTrendsViewController.new;
    KKMessageViewController *messageVC = KKMessageViewController.new;
    KKProfileViewController *profileVC = KKProfileViewController.new;
    return @[homeVC,actVC,messageVC,profileVC];
}

#pragma mark -TabarItems
-(NSArray<NSDictionary *> *)tabBarItems{
    NSDictionary *homeItem = @{
        CYLTabBarItemTitle:@"首页",
//        CYLTabBarItemImage:@"home_normal.png",
//        CYLTabBarItemSelectedImage:@"home_selected.png"
    };
    NSDictionary *actItem = @{
        CYLTabBarItemTitle:@"动态",
//        CYLTabBarItemImage:@"activity_normal.png",
//        CYLTabBarItemSelectedImage:@"activity_selected.png"
    };
    NSDictionary *messageItem = @{
        CYLTabBarItemTitle:@"消息",
//        CYLTabBarItemImage:@"message_normal.png",
//        CYLTabBarItemSelectedImage:@"message_selected.png"
    };
    NSDictionary *profileItem = @{
        CYLTabBarItemTitle:@"我的",
//        CYLTabBarItemImage:@"profile_normal.png",
//        CYLTabBarItemSelectedImage:@"profile_selected.png"
    };
    return @[homeItem,actItem,messageItem,profileItem];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
