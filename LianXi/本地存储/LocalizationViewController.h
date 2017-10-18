//
//  LocalizationViewController.h
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

#import "LocalModel.h"


@interface LocalizationViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;


@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *getBtn;
- (IBAction)saveDataClick:(id)sender;

- (IBAction)getDataClick:(id)sender;
@end

/*
 
{
    code = 000000;
    data =     {
        images = "https://www.scyd360.com/static/app/focus.png";
        time = 3;
        title = "";
        url = "";
    };
    message = "\U9996\U9875";
    status = 1;
}

*/


/*

{
    code = 000000;
    data =     {
        activity =         {
            "icon_url" = "https://www.scyd360.com/static/app/images/share_icon.png";
            "index_icon" = "";
            login = 1;
            "share_url" = "https://www.scyd360.com/app/activity/invite.html";
            "show_url" = "Htmlpage/activity_invite";
            summary = "\U9080\U8bf7\U6709\U793c";
            title = "\U9080\U8bf7\U6709\U793c";
        };
        bulltin =         (
                           {
                               "alias_id" = 2315;
                               infoid = 2315;
                               title = "\U5468\U4e0017:00\U53d1\U6807\U516c\U544a";
                           },
                           {
                               "alias_id" = 2314;
                               infoid = 2314;
                               title = "\U5468\U4e0014:00\U53d1\U6807\U516c\U544a";
                           },
                           {
                               "alias_id" = 2313;
                               infoid = 2313;
                               title = "\U5468\U4e0011:00\U53d1\U6807\U516c\U544a";
                           },
                           {
                               "alias_id" = 2312;
                               infoid = 2312;
                               title = "\U5468\U4e0010:00\U53d1\U6807\U516c\U544a";
                           },
                           {
                               "alias_id" = 2311;
                               infoid = 2311;
                               title = "\U5468\U65e517:00\U53d1\U6807\U516c\U544a";
                           },
                           {
                               "alias_id" = 2310;
                               infoid = 2310;
                               title = "\U5468\U65e511:00\U53d1\U6807\U516c\U544a";
                           },
                           {
                               "alias_id" = 2309;
                               infoid = 2309;
                               title = "\U5468\U65e510:00\U53d1\U6807\U516c\U544a";
                           },
                           {
                               "alias_id" = 2308;
                               infoid = 2308;
                               title = "\U5468\U516d17:00\U53d1\U6807\U516c\U544a";
                           },
                           {
                               "alias_id" = 2307;
                               infoid = 2307;
                               title = "\U5468\U516d14:00\U53d1\U6807\U516c\U544a";
                           },
                           {
                               "alias_id" = 2306;
                               infoid = 2306;
                               title = "\U5468\U516d11:00\U53d1\U6807\U516c\U544a";
                           }
                           );
        focus =         (
                         {
                             "img_url" = "https://www.scyd360.com/static/app/banner/banner3.png";
                             title = "\U661f\U706b\U94b1\U5305";
                             url = "https://www.scyd360.com/app/information/wallet.html?";
                         },
                         {
                             "img_url" = "https://www.scyd360.com/static/app/banner/banner2@1x.jpg";
                             title = "\U4e09\U7ea7\U5907\U6848";
                             url = "https://www.scyd360.com/app/information/detail.html?id=2185";
                         }
                         );
        ios =         {
            log = "1.\U66f4\U65b0\U4e86\U9996\U9875\U3001\U4ea7\U54c1\U5217\U8868\U3001\U4e2a\U4eba\U4e2d\U5fc3\U7684\U5e03\U5c40;
            \n 2.\U7406\U8d22\U9875\U9762\U6dfb\U52a0\U7b5b\U9009\U529f\U80fd;
            \n 3.\U7528\U6237\U53ef\U4ee5\U5728app\U8bbe\U7f6e\U4e2a\U6027\U5316\U5934\U50cf;
            \n 4.\U6dfb\U52a0vip\U7279\U6743\U6807.";
            title = "\U53d1\U73b0\U65b0\U7248\U672c";
            url = "https://itunes.apple.com/cn/app/%E5%8A%A9%E5%95%86%E7%90%86%E8%B4%A2-%E4%B8%93%E4%B8%9A%E6%B1%BD%E8%BD%A6%E9%87%91%E8%9E%8D%E7%90%86%E8%B4%A2%E5%B9%B3%E5%8F%B0/id1177880552?mt=8";
            version = 2;
        };
        lease =         {
            appointment = 1;
            "bid_deadline" = 1492678800;
            brand = "42-\U5927\U4f17";
            countCopies = "<null>";
            days = 0;
            "defer_rate" = 0;
            dktype = 3;
            dorm = 0;
            flag = 1;
            "if_vip" = 1;
            institution = "0.00";
            jlrate = 1;
            "loan_type" = "\U7eaf\U79df\U8d41";
            "max_subscribe_amount" = "84700.00";
            percentage = 0;
            periods = 3;
            price = "84700.00";
            "price_per_copy" = 50;
            productid = 4170;
            productname = "\U9093\U5148\U751f\U7eaf\U79df\U8d41\U6807";
            rate = "14.6";
            remainAmount = 84700;
            remainCopies = 1694;
            "server_side_time" = 1491811889;
            source = "\U6210\U90fd";
            sumRate = "15.6";
            timeLimit = "3\U6708";
            "unit_price" = 50;
            ybuserid = 1751;
            yytime = 1491814800;
        };
        novice =         {
            brand = "42-\U5927\U4f17";
            copies = 400;
            countCopies = 400;
            crje = 20000;
            "defer_rate" = 0;
            dktype = 1;
            dorm = 0;
            flag = 2;
            jlrate = 0;
            "loan_type" = "\U8d28\U62bc\U501f\U6b3e";
            "max_subscribe_amount" = "20000.00";
            percentage = 100;
            periods = 1;
            price = "20000.00";
            "price_per_copy" = 50;
            productid = 3902;
            productname = "\U5927\U4f17\U8f7f\U8f66\U8d28\U62bc\U501f\U6b3e\Uff08\U7eed\U501f\Uff09";
            rate = "14.6";
            remainAmount = 0;
            remainCopies = 0;
            "server_side_time" = 1491811889;
            sumRate = "14.6";
            syje = 0;
            timeLimit = "1\U6708";
            "unit_price" = 50;
            ytbfb = 100;
        };
        pledge =         {
            appointment = 0;
            "bid_deadline" = 1492678800;
            brand = "\U5176\U5b83";
            countCopies = "<null>";
            days = 0;
            "defer_rate" = 0;
            dktype = 1;
            dorm = 0;
            flag = 1;
            "if_vip" = 0;
            institution = "0.00";
            jlrate = 0;
            "loan_type" = "\U8d28\U62bc\U501f\U6b3e";
            "max_subscribe_amount" = "45000.00";
            percentage = 0;
            periods = 1;
            price = "45000.00";
            "price_per_copy" = 50;
            productid = 4171;
            productname = "\U7eb3\U667a\U6377\U8f7f\U8f66\U8d28\U62bc\U501f\U6b3e\Uff08\U7eed\U501f\Uff09";
            rate = "13.6";
            remainAmount = 45000;
            remainCopies = 900;
            "server_side_time" = 1491811889;
            source = "\U6606\U660e";
            sumRate = "13.6";
            timeLimit = "1\U6708";
            "unit_price" = 50;
            ybuserid = 0;
            yytime = 1491814800;
        };
        pop =         {
        };
        "u_plan" =         {
            appointment = 0;
            "bid_deadline" = 1492678800;
            brand = "\U5176\U5b83";
            countCopies = "<null>";
            days = 0;
            "defer_rate" = 2;
            dktype = 4;
            dorm = 0;
            flag = 1;
            "if_vip" = 0;
            institution = "0.00";
            jlrate = 0;
            "loan_type" = "U\U8d28\U8ba1\U5212";
            "max_subscribe_amount" = "53000.00";
            percentage = 0;
            periods = 1;
            price = "53000.00";
            "price_per_copy" = 50;
            productid = 4168;
            productname = "\U54c8\U5f17\U8f7f\U8f66U\U8d28\U8ba1\U5212";
            rate = "13.6";
            remainAmount = 53000;
            remainCopies = 1060;
            "server_side_time" = 1491811890;
            source = "\U6606\U660e";
            sumRate = "13.6";
            timeLimit = "1\U6708";
            "unit_price" = 50;
            ybuserid = 0;
            yytime = 1491814800;
        };
    };
    message = "\U9996\U9875";
    status = 1;
}
*/


