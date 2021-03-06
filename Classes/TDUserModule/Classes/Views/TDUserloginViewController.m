//
//  TDUserloginViewController.m
//  Pods
//
//  Created by tiandy on 2019/3/15.
//

#import "TDUserloginViewController.h"
#import "TDUserLoginPresenter.h"

@interface TDUserloginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *showPwdButton;
@property (nonatomic,strong) id<TDUserLoginPresenterDelegate> presenter;

@end

@implementation TDUserloginViewController

#pragma mark ============life cycle
- (instancetype)init {
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"TDModules" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    return [[TDUserloginViewController alloc] initWithNibName:@"TDUserloginViewController" bundle:bundle];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.presenter = [[TDUserLoginPresenter alloc] init];
    [self.presenter initWithView:self];
    
}
#pragma mark ============TDUserLoginViewDelegate
-(void)setViewWithUserName:(NSString *)userName Password:(NSString *)pwd {
    _usernameTF.text = userName;
    _pwdTF.text = pwd;
}
-(void)loginSuccess {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"登录成功" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)loginFailWithErrorMassage:(NSString *)error {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:error preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark ============actions

- (IBAction)onClickForgetButton:(id)sender {
    NSLog(@"goto forget");
}
- (IBAction)onClickRegisterButton:(id)sender {
    NSLog(@"goto register");
}
- (IBAction)onClickShowPwdButton:(id)sender {
    UIButton * btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    if (btn.selected) {
        _pwdTF.secureTextEntry = NO;
    }else{
        _pwdTF.secureTextEntry = YES;
    }
}
- (IBAction)onClickLoginButton:(id)sender {
    [self.presenter loginWithUserName:self.usernameTF.text Password:self.pwdTF.text];
}
- (IBAction)onClickBackButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        self.presenter = nil;
    }];
}


@end
