//
//  LocalizationViewController.m
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "LocalizationViewController.h"

@interface LocalizationViewController ()

@end

@implementation LocalizationViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //读取本地数据
    NSString *path = [NSString stringWithFormat:@"%@/bulltin.plist",[Tools sandBoxPath]];
    NSMutableData* data = [[NSMutableData alloc] initWithContentsOfFile:path];
    NSKeyedUnarchiver* unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    self.dataArray = [unarchiver decodeObjectForKey:@"People"];
    [unarchiver finishDecoding];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    LocalModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.alias_id;
    return cell;
}

- (IBAction)saveDataClick:(id)sender {
    //-[LocalModel encodeWithCoder:]: unrecognized selector sent to instance 0x61800002c180'   这句话的意思是 ：LocalModel尝试去调用：encodeWithCoder方法,但是encodeWithCoder这个方法并没有实现
    
    NSString *path = [NSString stringWithFormat:@"%@/bulltin.plist",[Tools sandBoxPath]];
    NSMutableData* data = [[NSMutableData alloc] init];
    NSKeyedArchiver* archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self.dataArray forKey:@"People"];
    [archiver finishEncoding];
    [data writeToFile:path atomically:YES];
    
}

- (IBAction)getDataClick:(id)sender {
    NSString *url = @"https://www.scyd360.com/api/Index/index";
    //     NSString *url = @"https://www.scyd360.com/api/Index/Welcome";
    __weak typeof(self) weakself = self;
    [NetWork get:nil url:url sucess:^(id object) {
        for (NSDictionary *d in object[@"data"][@"bulltin"]) {
            LocalModel *model = [[LocalModel alloc] initWithDictionary:d];
            [weakself.dataArray addObject:model];
        }
        [weakself.tableView reloadData];
    } failture:^(id object) {
    }];
}


- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.getBtn.frame) + 30, CGRectGetWidth(self.view.bounds), CGRectGetMaxY(self.view.frame) - CGRectGetMaxY(self.getBtn.frame) - 30) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
        [self.view addSubview:_tableView];
    }
    return _tableView;
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
