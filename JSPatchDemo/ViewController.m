//
//  ViewController.m
//  JSPatchDemo
//
//  Created by 张亚丰 on 15/8/18.
//  Copyright (c) 2015年 zhangyafeng. All rights reserved.
//

#import "ViewController.h"
#import "JPTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushAction:(id)sender {
    JPTableViewController *vc = [[JPTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
