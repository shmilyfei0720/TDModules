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
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"TDModules" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    return [[TDUserloginViewController alloc] initWithNibName:@"TDUserloginViewController" bundle:bundle];
}

@end
