//
//  KTabBarVC.m
//  KZProductOC
//
//  Created by KZ on 2021/9/11.
//

#import "KTabBarVC.h"

@interface KTabBarVC ()

@end

@implementation KTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:4];
    NSArray *controllerNames = @[@"HomeVC",@"HomeVC",@"HomeVC",@"HomeVC",@"HomeVC"];
    NSArray *titles = @[@"项目",@"控件&三方",@"",@"三方开发",@"测试"];
    NSArray *picImgMiddleNames = @[@"home",@"list",@"add",@"air",@"debug"];
    
    for (int i = 0; i<controllerNames.count; i++) {
        
        Class cl = NSClassFromString(controllerNames[i]);
        
        UIViewController *vc = [[cl alloc]init];
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        //设置导航栏的背景色
//        nav.navigationBar.barTintColor = [UIColor whiteColor];
        //设置导航栏的文字属性
//        [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
        if (i == 2) {
            nav.tabBarItem.image = [[UIImage imageNamed:@"tabbar_middle"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        } else {
            //默认展示图片
            nav.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%@_nor",picImgMiddleNames[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            //选中时的图片
            nav.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%@_sel",picImgMiddleNames[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
        
        
        
        //默认字体颜色（可设置大小:NSFontAttributeName）
        UIColor *foregroundColor = [UIColor colorWithRed:138/255.0 green:138/255.0 blue:138/255.0 alpha:1.0];
        [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:foregroundColor} forState:UIControlStateNormal];
        
        //选中时字体的颜色（可设置大小:NSFontAttributeName）
        UIColor *selColor = [UIColor colorWithRed:27/255.0 green:206/255.0 blue:159/255.0 alpha:1.0];
        [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:selColor} forState:UIControlStateSelected];
        
        //侧滑返回
        nav.interactivePopGestureRecognizer.delegate = (id)self;
        
        //导航栏标题
        vc.title = titles[i];
        
        //导航栏不透明
        nav.navigationBar.translucent = NO;
        
        UIColor *lightGrayColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
        //设置导航栏的背景颜色
        nav.navigationBar.barTintColor = lightGrayColor;
        
        //设置导航栏字体颜色
//        nav.navigationBar.tintColor = selColor;
        [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
        
        //设置菜单栏背景颜色
        self.tabBar.barTintColor =lightGrayColor;
        
        //iOS13之后加上这一句，否则tabbar的字体会还原为默认颜色
        self.tabBar.tintColor = selColor;
        
        //隐藏某个窗口的导航栏
        if (i == 3) {
//            nav.navigationBar.hidden = YES;
        }
        //设置角标
//        nav.tabBarItem.badgeValue = @"角标";
        //设置角标颜色
//        nav.tabBarItem.badgeColor = [UIColor blueColor];
        
        [controllers addObject:nav];
    }
    
    self.viewControllers = controllers;
    
    //默认展示的窗口
    self.selectedIndex = 0;
    
}


@end
