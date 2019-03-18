//
//  TDUserLoginPresenter.m
//  Pods
//
//  Created by tiandy on 2019/3/15.
//

#import "TDUserLoginPresenter.h"
#import "TDUserloginModel.h"

#define ws(type)  __weak typeof(type) ws = type; // weak
#define ss(type,ws)  __strong typeof(type) ss = ws; // strong


@interface TDUserLoginPresenter ()
@property (nonatomic,weak) id<TDUserLoginViewDelegate> view;
@property (nonatomic,strong) id<TDUserLoginModelDelegate> model;
@end

@implementation TDUserLoginPresenter

-(void)initWithView:(id<TDUserLoginViewDelegate>)view {
    _view = view;
    _model = [[TDUserloginModel alloc] init];
    
    [_view setViewWithUserName:_model.username Password:_model.pwd];
}

-(void)loginWithUserName:(NSString *)userName Password:(NSString *)pwd {
    
    ws(self)
    [_model loginWithUserName:userName Password:pwd Success:^{
        if ([ws.view respondsToSelector:@selector(loginSuccess)]) {
            [ws.view loginSuccess];
        }
    } Fail:^(int errorcode) {
        if ([ws.view respondsToSelector:@selector(loginFailWithErrorMassage:)]) {
            [ws.view loginFailWithErrorMassage:@"登录失败"];
        }
    }];
}

@end
