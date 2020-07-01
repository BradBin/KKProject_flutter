//
//  KKHomeViewController.m
//  KKProject_flutter
//
//  Created by youbin on 2020/6/30.
//  Copyright © 2020 youbin. All rights reserved.
//

#import "KKHomeViewController.h"
#import "KKTrendsViewController.h"


@interface KKHomeViewController ()

@end

@implementation KKHomeViewController

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
