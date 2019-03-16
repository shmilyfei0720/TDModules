//
//  ViewController.m
//  TDModules
//
//  Created by tiandy on 2019/3/15.
//  Copyright © 2019 tiandy. All rights reserved.
//

#import "ViewController.h"
#import "TDMediator+TDUserModule.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 200, 60)];
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(test)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)test {
    UIViewController *vc = [[TDMediator sharedInstance] TDUserModule_getUserLoginViewController];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
