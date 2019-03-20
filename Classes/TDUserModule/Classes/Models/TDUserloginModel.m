//
//  TDUserloginModel.m
//  Pods
//
//  Created by tiandy on 2019/3/15.
//

#import "TDUserloginModel.h"
#import <AFNetworking/AFNetworking.h>

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
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    NSString *url =[NSString stringWithFormat:@"http://39.106.178.186/userlogin?name=%@&pwd=%@",userName,pwd];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        int ret = [[responseObject objectForKey:@"ret"] intValue];
        if (ret == 0 && success) {
            success();
        }else{
            if (fail) {
                fail(-1);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(-1);
        }
    }];
}

@end
