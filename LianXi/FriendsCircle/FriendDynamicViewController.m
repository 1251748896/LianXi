//
//  FriendDynamicViewController.m
//  LianXi
//
//  Created by Mac on 17/7/4.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "FriendDynamicViewController.h"

@interface FriendDynamicViewController ()

@end

@implementation FriendDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeUserInterface];
    [self initializeDataSource];
}



- (void)initializeDataSource {
    
    //    NSString *url = @"https://www.scyd360.com/api/Index/index";
    
//    __weak typeof(self) weakself = self;
    
    
    ///data/attachment/201703/20/dd24b118c32ceaaaedb506e3beb9d1d9.jpg
    
    // /data/attachment/201703/20/67021fe90a6a590296416d7d5c40f5fa.jpg
    
    
    /**
     
     用户头像
     https://www.scyd360.com/data/public/5510/201704/b638d933178a8ace0d2f485ef7255143_thumb.jpg
     
     
     
     base https://www.scyd360.com
     
     瑜伽垫
     /data/attachment/201703/20/dd24b118c32ceaaaedb506e3beb9d1d9.jpg
     户外两用帐篷
     /data/attachment/201703/20/67021fe90a6a590296416d7d5c40f5fa.jpg
     埃微运动手环全触控版
     /data/attachment/201703/06/cbceabd0ad66380ab4db9b2df31878f2.jpg
     200话费
     /data/attachment/201703/06/c8658a44d06842647fbfb602c35714a2.jpg
     现金券188
     /data/attachment/201609/26/299aaa1dec972c5147f0ee5d592283ad.png
     
     **/
    NSString *header = @"https://www.scyd360.com/data/public/5510/201704/b638d933178a8ace0d2f485ef7255143_thumb.jpg";
    
    NSArray *hhhhh = @[header,header,header,header,header];
    NSArray *nnnnn = @[@"老张",@"老王",@"老李",@"老杨",@"老田"];
    
    NSArray *iiiii = @[@"https://www.scyd360.com/data/attachment/201703/20/dd24b118c32ceaaaedb506e3beb9d1d9.jpg",@"https://www.scyd360.com/data/attachment/201703/20/67021fe90a6a590296416d7d5c40f5fa.jpg",@"https://www.scyd360.com/data/attachment/201703/06/cbceabd0ad66380ab4db9b2df31878f2.jpg",@"https://www.scyd360.com/data/attachment/201703/06/c8658a44d06842647fbfb602c35714a2.jpg",@"https://www.scyd360.com/data/attachment/201609/26/299aaa1dec972c5147f0ee5d592283ad.png"];
    NSArray *ttttt = @[@"今天又下雨了今天又下雨了今天又下雨了今天又下雨了今天又下雨了今天又下雨了",@"今天又下雨了今天又下雨了今天又下雨了",@"今天又下雨了",@"今天又下雨了",@"今天又下雨了今天又下雨了今天又下雨了今天又下雨了今天又下雨了"];
    
    
    for (int i=0; i<ttttt.count; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        //发表的图片
        NSMutableArray *images = [NSMutableArray array];
        //图片数量
        int a = arc4random()%6 - 1;
        for (int y=0; y<a; y++) {
            //图片的index
            int x = arc4random()%a;
            [images addObject:iiiii[x]];
        }
        [dic setObject:images forKey:image];
        
        //文字
        NSString *sss = ttttt[a];
        [dic setObject:sss forKey:text];
        
        //name
        NSString *name = nnnnn[a];
        [dic setObject:name forKey:name];
        
        //h_image
        NSString *h_image = hhhhh[a];
        [dic setObject:h_image forKey:header];
        
        [self.dataArray addObject:dic];
        
    }
    
    [self.tableView reloadData];
}

- (void)initializeUserInterface {
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    FriendCircleListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[FriendCircleListCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSDictionary *dic = self.dataArray[indexPath.row];
    NSString *h = [NSString stringWithFormat:@"%@",dic[header]];
    cell.userImgaeView.image = [UIImage imageNamed:h];
    NSString *n = [NSString stringWithFormat:@"%@",dic[name]];
    cell.nameLabel.text = n;
    cell.timeLabel.text = @"上午10点";
    NSString *t = [NSString stringWithFormat:@"%@",dic[text]];
    cell.textLLLabel.text = t;
    
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:dic[image][0]]];
//    UIImage *imageData = [UIImage imageWithData:data];
    
    cell.dynamicImages = dic[image];
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
