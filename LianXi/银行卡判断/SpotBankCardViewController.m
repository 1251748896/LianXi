//
//  SpotBankCardViewController.m
//  LianXi
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "SpotBankCardViewController.h"

@interface SpotBankCardViewController ()

@end

@implementation SpotBankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self ppp];
    [self qqq];
    
}

- (void)qqq {
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = [UIColor redColor].CGColor;
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 200, 100, 100)].CGPath;
    border.frame = CGRectMake(100, 200, 100, 100);
    border.masksToBounds = YES;
    border.cornerRadius = 5.0f;
    border.lineWidth = 10;
    border.lineCap = @"square";
    border.lineDashPattern = @[@4, @2];
    [self.view.layer addSublayer:border];

}

- (void)ppp {
    
    UIImageView *_imageV_IDCard = [[UIImageView alloc] initWithFrame:CGRectMake(22, 66, 100 / 2.0 , 100 / 2.0)];
    
    _imageV_IDCard.layer.cornerRadius = 25;
    
    _imageV_IDCard.backgroundColor = [UIColor lightGrayColor];
    
    
    CAShapeLayer *_shapeLayer = [CAShapeLayer layer];
    
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    _shapeLayer.fillColor = [UIColor greenColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_imageV_IDCard.bounds cornerRadius:25];
    
    _shapeLayer.path = path.CGPath;
    
    _shapeLayer.frame = _imageV_IDCard.bounds;
    
    _shapeLayer.lineWidth = 2;
    
    _shapeLayer.lineCap = @"square";
    
    _shapeLayer.lineDashPattern = @[@5, @5];
    
    [self.view addSubview:_imageV_IDCard];
    
    [_imageV_IDCard.layer addSublayer:_shapeLayer];
    
}

- (void)ooo {
    //    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    //    [shapeLayer setFillColor:nil];
    ////    shapeLayer.cornerRadius = 3.0;
    ////    shapeLayer.masksToBounds = YES;
    //    // 设置虚线颜色
    //    [shapeLayer setStrokeColor:[[UIColor redColor] CGColor]];
    //    // 3.0f设置虚线的宽度
    //    [shapeLayer setLineWidth:15];
    //    [shapeLayer setLineJoin:kCALineJoinRound];
    //    // 3=线的宽度 1=每条线的间距
    //    [shapeLayer setLineDashPattern:
    //     [NSArray arrayWithObjects:[NSNumber numberWithInt:5],
    //      [NSNumber numberWithInt:5],nil]];
    
    // Setup the path
    //    CGMutablePathRef path = CGPathCreateMutable();
    
    // 代表初始坐标的x，y
    //    CGPathMoveToPoint(path, NULL, 100, 0);
    //代表末尾坐标的x，y
    //    CGPathAddLineToPoint(path, NULL, 100,110);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.view.bounds;
    [shapeLayer setStrokeColor:[UIColor redColor].CGColor];
    shapeLayer.path = path.CGPath;
    //    self.layer.mask = maskLayer;
    
    //    [path setLineWidth:20];
    
    [shapeLayer setPath:path.CGPath];
    //    CGPathRelease(path.CGPath);
    // 可以把bg改成任何你想要的UIView
    self.view.layer.mask = shapeLayer;
}

- (void)kkk {
    [self.bankNumTF addTarget:self action:@selector(textFieldTextDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.bankNumTF.keyboardType = UIKeyboardTypeDecimalPad;
}

- (void)textFieldTextDidChange:(UITextField *)textField {
    NSString *name = [self getBankNameWithCardId:textField.text];
    NSLog(@"哈哈:%@",name);
    if (name.length) {
        if ([name containsString:@"·"]) {
            NSArray *array = [name componentsSeparatedByString:@"·"];
            NSString *n = [NSString stringWithFormat:@"%@",[array firstObject]];
            self.bankNameLabel.text = n;
            return;
        }
        self.bankNameLabel.text = name;
    }
}

//判断是不是银行卡
- (BOOL)checkCardNum:(NSString*)cardNum {
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[cardNum length];
    int lastNum = [[cardNum substringFromIndex:cardNoLength-1] intValue];
    
    cardNum = [cardNum substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [cardNum substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

//根据卡号得到银行名字
- (NSString *)getBankNameWithCardId:(NSString*) cardId {
    
    NSString *demoPlistPath = [[NSBundle mainBundle] pathForResource:@"bank&cardkind" ofType:@"plist"];
    NSDictionary *demoDict = [NSDictionary dictionaryWithContentsOfFile:demoPlistPath];
    
    
    
    
    //发卡行.卡种名称
    NSArray *bankName = [demoDict objectForKey:@"bankName"];
    //BIN号
    NSArray* bankBin = [demoDict objectForKey:@"bankBin"];
    int index = -1;
    if(cardId==nil || cardId.length<16 || cardId.length>19){
        return @"";
    }
    //6位Bin号
    NSString* cardbin_6 = [cardId substringWithRange:NSMakeRange(0, 6)];
    for (int i = 0; i < bankBin.count; i++) {
        if ([cardbin_6 isEqualToString:bankBin[i]]) {
            index = i;
        }
    }
    if (index != -1) {
        return bankName[index];
    }
    //8位Bin号
    NSString* cardbin_8 = [cardId substringWithRange:NSMakeRange(0, 8)];
    for (int i = 0; i < bankBin.count; i++) {
        if ([cardbin_8 isEqualToString:bankBin[i]]) {
            index = i;
        }
    }
    if (index != -1) {
        return bankName[index];
    }
    return @"";
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
