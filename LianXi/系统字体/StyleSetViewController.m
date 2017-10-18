//
//  StyleSetViewController.m
//  LianXi
//
//  Created by Mac on 17/4/11.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "StyleSetViewController.h"

@interface StyleSetViewController ()

@end

@implementation StyleSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //数据源
    NSMutableArray *array = [Tools wordStyle];
    
    NSLog(@"array = %@",array);
    
    if (array.count == 2) {
        self.sectionArray = [array firstObject];
        self.detailArray = [array lastObject];
    }
    
    for (int i=0; i<self.sectionArray.count; i++) {
        //
        [self.sectionStateArray addObject:@"0"];
    }
    
    
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveThisStyle)];
    self.navigationItem.rightBarButtonItem = saveBtn;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 44)];
    vi.layer.borderWidth = 1.0;
    vi.layer.borderColor = [UIColor lightGrayColor].CGColor;
    vi.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:vi.bounds];
    label.userInteractionEnabled = YES;
    label.tag = section;
    [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionClick:)]];
    label.backgroundColor = [UIColor whiteColor];
    label.font = [Tools tinFontSize:17];
    NSArray *arr = self.detailArray[section];
    NSString *cou = [NSString stringWithFormat:@"%ld",(long)arr.count];
    label.text = [NSString stringWithFormat:@"%@(%@种)",self.sectionArray[section],cou];
    [vi addSubview:label];
    
    
    
    return vi;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([self.sectionStateArray[section] isEqualToString:@"1"]) {
        NSMutableArray *arr = self.detailArray[section];
        return arr.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.detailArray[indexPath.section][indexPath.row]];
    cell.textLabel.font = [Tools tinFontSize:17];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    _style = [NSString stringWithFormat:@"%@",self.detailArray[indexPath.section][indexPath.row]];
}

#pragma mark - <click>

- (void)sectionClick:(UITapGestureRecognizer *)gesture {
    UILabel *llll = (UILabel *)gesture.view;
    NSString *statessss = [NSString stringWithFormat:@"%@",self.sectionStateArray[llll.tag]];
    if ([statessss isEqualToString:@"0"]) {
        [self.sectionStateArray replaceObjectAtIndex:llll.tag withObject:@"1"];
    } else {
        [self.sectionStateArray replaceObjectAtIndex:llll.tag withObject:@"0"];
    }
    //刷新区
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:llll.tag] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)saveThisStyle {
    if (_style.length) {
        if (self.change) {
            self.change(_style);
        }
        
        [[NSUserDefaults standardUserDefaults] setObject:_style forKey:@"fontName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSMutableArray *)sectionStateArray {
    if (!_sectionStateArray) {
        _sectionStateArray = [NSMutableArray array];
    }
    return _sectionStateArray;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = [UIColor redColor];
        _tableView.sectionHeaderHeight = 44;
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
