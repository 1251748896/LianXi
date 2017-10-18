//
//  AnimationViewController.m
//  LianXi
//
//  Created by Mac on 17/4/14.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initializeUserInterface];
    
    int i = 100;
    int j = 200;
    
    if (j == 200) {
        int i = 50;
        
        NSLog(@"i = %d",i);
        
    }
    
    NSLog(@"外面的 i = %d",i);
    
    
    
}

- (void)initializeUserInterface {
    //头尾式动画、block动画、序列帧动画
    //CoreAnimation---->依靠于CALayer核心动画
    //CoreAnimation执行过程都是在后台执行的，不会阻塞主线程
    
    
    //1.创建一个核心动画
    //2.把核心动画添加到相应的layer上
    //3.如果需要停止
    
    //
    
    self.navigationItem.title = @"动画";
    
    [self.dataArray addObject:@"转场动画"];
    [self.dataArray addObject:@"转盘抽奖动画"];
    [self.dataArray addObject:@"basic动画"];
    [self.dataArray addObject:@"keyframe动画"];
    [self.dataArray addObject:@"group动画"];
    [self.dataArray addObject:@"手势"];
    [self.dataArray addObject:@"下拉放大图片"];
    
    self.tableView.rowHeight = 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        TransitionViewController *local = [[TransitionViewController alloc] init];
        
        CATransition *trans = [[CATransition alloc] init];
        trans.type = JiangBoTransitionType(TransitionAnimationTypeRippleEffect);
//        trans.duration = 0.25;
        trans.subtype = kCATransitionFromLeft;
        [self.navigationController.view.layer addAnimation:trans forKey:@"my"];
        
        [self.navigationController pushViewController:local animated:YES];
    } else if (indexPath.row == 1) {
        MakePrizeViewController *style = [[MakePrizeViewController alloc] init];
        [self.navigationController pushViewController:style animated:YES];
    } else if (indexPath.row == 2) {
        CABasicAnimationViewController *vc = [[CABasicAnimationViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 3) {
        CAKeyframeAnimationViewController *vc = [[CAKeyframeAnimationViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 4) {
        CAAnimationGroupViewController *vc = [[CAAnimationGroupViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 5) {
        GestureTestViewController *vc = [[GestureTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 6) {
        PicLaShenViewController *vc = [[PicLaShenViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 7) {
        
    }
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
