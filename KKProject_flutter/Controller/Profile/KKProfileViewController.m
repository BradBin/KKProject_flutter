//
//  KKProfileViewController.m
//  KKProject_flutter
//
//  Created by youbin on 2020/7/1.
//  Copyright © 2020 youbin. All rights reserved.
//

#import "KKProfileViewController.h"
#import "KKTrendsViewController.h"

@interface KKProfileViewController ()

@end

@implementation KKProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:KKTrendsViewController.new animated:true];
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
