//
//  TDUserLoginContract.h
//  Pods
//
//  Created by tiandy on 2019/3/15.
//

#import <Foundation/Foundation.h>

@protocol TDUserLoginModelDelegate <NSObject>

@property (nonatomic,strong) NSString *username;
@property (nonatomic,strong) NSString *pwd;

-(void)loginWithUserName:(NSString *)userName Password:(NSString *)pwd Success:(void(^)(void))success Fail:(void(^)(int errorcode))fail;

@end

@protocol TDUserLoginViewDelegate <NSObject>

-(void)setViewWithUserName:(NSString *)userName Password:(NSString *)pwd;
-(void)loginSuccess;
-(void)loginFailWithErrorMassage:(NSString *)error;
@end

@protocol TDUserLoginPresenterDelegate <NSObject>

-(void)initWithView:(id<TDUserLoginViewDelegate>)view;
-(void)loginWithUserName:(NSString *)userName Password:(NSString *)pwd;

@end
