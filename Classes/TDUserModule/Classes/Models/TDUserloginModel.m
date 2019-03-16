//
//  TDUserloginModel.m
//  Pods
//
//  Created by tiandy on 2019/3/15.
//

#import "TDUserloginModel.h"

@implementation TDUserloginModel
@synthesize pwd = _pwd;
@synthesize username = _username;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _username = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
        _pwd = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    }
    return self;
}

- (void)loginWithUserName:(NSString *)userName Password:(NSString *)pwd Success:(void (^)(void))success Fail:(void (^)(int))fail {
    NSLog(@"web service start");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:1.5];
        int i = arc4random() % 100 ;
        if (i > 50) {
            success();
        }else{
            fail(-1);
        }
    });
}

@end
