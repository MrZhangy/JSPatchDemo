//
//  JPTableViewController.m
//  JSPatchDemo
//
//  Created by 张亚丰 on 15/8/18.
//  Copyright (c) 2015年 zhangyafeng. All rights reserved.
//

#import "JPTableViewController.h"

@interface JPTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation JPTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    static NSInteger i = 0;
    cell.textLabel.text = [NSString stringWithFormat:@"%d",i++];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *content = self.dataSource[[indexPath row]];  //may cause out of bound
}

- (NSArray *)dataSource
{
    return @[@"JSPatch", @"is"];
}

- (void)customMethod
{
    NSLog(@"callCustom method");
}
@end
