//
//  ViewController1.m
//  ZSLCommonExample
//
//  Created by zhoushaolong on 15/10/10.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "ViewController1.h"
#import "ExampleManager.h"

@interface ViewController1 ()
@property(nonatomic, weak)IBOutlet UITableView* tabList;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title =@"demo1";
    
    __weak UIView* superView = self.view;
    [_tabList makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(superView.top);
        make.left.equalTo(superView.left);
        make.right.equalTo(superView.right);
        make.bottom.equalTo(superView.bottom);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)dealloc
{}

+(instancetype)instantiateFromMainStoryboard{
    return (ViewController1*)[Utils controllerInMainStroyboardWithID:@"ViewController1"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)requestServerDataWith:(BOOL)bLoading{
    [[ExampleManager sharedInstance] terminalSignIn:[[ReqExampleModel alloc] init]
                                            success:^(jsonResponse *responseData){
                                                
                                            }
                                             failed:^(HttpStatusCode errCode, NSString *message){
                                                 
                                             }];
}
@end
