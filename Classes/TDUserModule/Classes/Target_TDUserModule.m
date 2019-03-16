//
//  Target_TDUserModule.m
//  Pods
//
//  Created by tiandy on 2019/3/15.
//

#import "Target_TDUserModule.h"
#import "TDUserloginViewController.h"

@implementation Target_TDUserModule

-(UIViewController *)Action_getUserLoginViewController:(NSDictionary *)params {
    return [[TDUserloginViewController alloc] init];
}

@end
