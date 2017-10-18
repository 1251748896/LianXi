//
//  PicLaShenViewController.m
//  LianXi
//
//  Created by Mac on 17/5/3.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "PicLaShenViewController.h"


@interface PicLaShenViewController ()

@end

@implementation PicLaShenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.rowHeight = 44;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UIImageView *imageView_t = [[UIImageView alloc] init];
    imageView_t.image = [UIImage imageNamed:@"lol_js.jpg"];
    imageView_t.frame = CGRectMake(0, -kHEIGHT, CGRectGetWidth(self.view.bounds), kHEIGHT);
    [self.tableView addSubview:imageView_t];
    imageView_t.tag = 100;
    
    //上、左、下、右
    self.tableView.contentInset = UIEdgeInsetsMake(kHEIGHT, 0, 0, 0);
    
    
    //添加文字
    //用frame控制
    UILabel *tes = [[UILabel alloc] init];
    tes.frame = CGRectMake(10, CGRectGetHeight(imageView_t.bounds) - 30, 150, 30);
    tes.backgroundColor = [UIColor redColor];
    tes.text = @"你好,我是机器人";
    tes.tag = 101;
    [imageView_t addSubview:tes];
    
    UILabel *tes1 = [[UILabel alloc] init];
//    tes1.frame = CGRectMake(CGRectGetMaxX(tes.frame) + 20, CGRectGetHeight(imageView_t.bounds) - 30, 150, 30);
    tes1.backgroundColor = [UIColor redColor];
    tes1.text = @"你好,我是tes1";
    tes1.tag = 102;
    [imageView_t addSubview:tes1];
    
    [tes1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tes.mas_right).offset(20);
        make.top.equalTo(tes.mas_top);
        make.bottom.equalTo(tes.mas_bottom);
        make.width.equalTo(tes.mas_width);
    }];
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;
    
    if (point.y < -kHEIGHT) {
        
        UIImageView *bg = [self.tableView viewWithTag:100];
        
        CGRect rect = bg.frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        bg.frame = rect;
        
        //改变frame
        UILabel *tes = [self.tableView viewWithTag:101];
        tes.frame = CGRectMake(10, CGRectGetHeight(rect) - 30, 150, 30);
        
        //改变约束
        UILabel *tes1 = [self.tableView viewWithTag:102];
        [tes1 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(tes.mas_right).offset(20);
            make.top.equalTo(tes.mas_top);
            make.bottom.equalTo(tes.mas_bottom);
            make.width.equalTo(tes.mas_width);
        }];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cell_b";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行",indexPath.row];
    
    return cell;
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
