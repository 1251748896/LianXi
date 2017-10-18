//
//  MusicsListViewController.m
//  LianXi
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "MusicsListViewController.h"

@interface MusicsListViewController ()

@end

@implementation MusicsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initializeUserInterface];
    [self initializeDataSource];
    
}

- (void)initializeDataSource {
    
//    NSString *url = @"https://www.scyd360.com/api/Index/index";
    
    __weak typeof(self) weakself = self;
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [self get:kMusicUrl paramter:dic success:^(NSDictionary *dic) {
        //list
        for (NSDictionary *d in dic[@"tracks"][@"list"]) {
            MusicListModel *model = [[MusicListModel alloc] initWithDictionary:d];
            [weakself.dataArray addObject:model];
        }
        [weakself.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}


- (void)initializeUserInterface {
    self.navigationItem.title = @"我的音乐";
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
    MusicListModel *model = self.dataArray[indexPath.row];
    
    NSURL *URL = [NSURL URLWithString:model.coverLarge];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    UIImage *image = [UIImage imageWithData:data];
    cell.imageView.image = image;
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverLarge] placeholderImage:[UIImage imageNamed:@"512x512bb.jpg"]];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.nickname;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MusicPlayerViewController *vc = [MusicPlayerViewController musicPlayer];
    [MusicManager manager].musicArray = self.dataArray;
    [MusicManager manager].index = indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
    
    
//    MusicPlayerViewController *vc = [MusicPlayerViewController shareInstance];
//    [MusicManager shareInfo].musicArray = self.dataArray;
//    [MusicManager shareInfo].index = indexPath.row;
//    [self.navigationController pushViewController:vc animated:YES];
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 70;
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
