//
//  Tools.m
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "Tools.h"

@implementation Tools




NSString * JiangBoTransitionType(TransitionAnimationType type) {
    
    switch (type) {
        case TransitionAnimationTypeFade:
            return @"fade";
            break;
        case TransitionAnimationTypePush:
            return @"push";
            break;
        case TransitionAnimationTypeMoveIn:
            return @"moveIn";
            break;
        case TransitionAnimationTypeReveal:
            return @"reveal";
            break;
        case TransitionAnimationTypeCube:
            return @"cube";
            break;
        case TransitionAnimationTypeSuckEffect:
            return @"suckEffect";
            break;
        case TransitionAnimationTypeOglFlip:
            return @"oglFlip";
            break;
        case TransitionAnimationTypeRippleEffect:
            return @"rippleEffect";
            break;
        case TransitionAnimationTypePageCurl:
            return @"pageCurl";
            break;
        case TransitionAnimationTypePageUnCurl:
            return @"pageUnCurl";
            break;
        case TransitionAnimationTypeCameraIrisHollowOpen:
            return @"cameraIrisHollowOpen";
            break;
        case TransitionAnimationTypeCameraIrisHollowClose:
            return @"cameraIrisHollowClose";
            break;
            
        default:
            break;
    }
    return @"push";//默认值
}

NSString * fontStyle() {
    return @"jjjjj";
}

#pragma mark- <hhhhhh经验总结kkkk>

+ (void)compareDateWithEarlyDate:(NSDate *)eDate laterDate:(NSDate *)lDate {
    //比较两个时间的相差时间
    NSDate* date1 = eDate;
    NSDate* date2 = lDate;
    //计算相差的秒钟数
    NSTimeInterval distanceBetweenDates = [date1 timeIntervalSinceDate:date2];
    double secondsInAnHour = 3600;
    // 除以3600是把秒化成小时，除以60得到结果为相差的分钟数
    NSInteger hoursBetweenDates = distanceBetweenDates / secondsInAnHour;
    
}

+ (void)kkkkk {
    //计算两个点之间的距离
    /*
//    / 需要导入#import
    CLLocation *locA = [[CLLocation alloc] initWithLatitude:34 longitude:113];
    CLLocation *locB = [[CLLocation alloc] initWithLatitude:31.05 longitude:121.76];
    // CLLocationDistance求出的单位为米
    CLLocationDistance distance = [locA distanceFromLocation:locB];

     */
    
    /*
     
     // 打开设置->通用
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=General"]];
     
     // 以下是设置其他界面
     prefs:root=General&path=About
     prefs:root=General&path=ACCESSIBILITY
     prefs:root=AIRPLANE_MODE
     prefs:root=General&path=AUTOLOCK
     prefs:root=General&path=USAGE/CELLULAR_USAGE
     prefs:root=Brightness
     prefs:root=Bluetooth
     prefs:root=General&path=DATE_AND_TIME
     prefs:root=FACETIME
     prefs:root=General
     prefs:root=General&path=Keyboard
     prefs:root=CASTLE
     prefs:root=CASTLE&path=STORAGE_AND_BACKUP
     prefs:root=General&path=INTERNATIONAL
     prefs:root=LOCATION_SERVICES
     prefs:root=ACCOUNT_SETTINGS
     prefs:root=MUSIC
     prefs:root=MUSIC&path=EQ
     prefs:root=MUSIC&path=VolumeLimit
     prefs:root=General&path=Network
     prefs:root=NIKE_PLUS_IPOD
     prefs:root=NOTES
     prefs:root=NOTIFICATIONS_ID
     prefs:root=Phone
     prefs:root=Photos
     prefs:root=General&path=ManagedConfigurationList
     prefs:root=General&path=Reset
     prefs:root=Sounds&path=Ringtone
     prefs:root=Safari
     prefs:root=General&path=Assistant
     prefs:root=Sounds
     prefs:root=General&path=SOFTWARE_UPDATE_LINK
     prefs:root=STORE
     prefs:root=TWITTER
     prefs:root=FACEBOOK
     prefs:root=General&path=USAGE prefs:root=VIDEO
     prefs:root=General&path=Network/VPN
     prefs:root=Wallpaper
     prefs:root=WIFI
     prefs:root=INTERNET_TETHERING
     prefs:root=Phone&path=Blocked
     prefs:root=DO_NOT_DISTURB
     
     在UITextView中显示html文本
     UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 30, 100, 199)];
     textView.backgroundColor = [UIColor redColor];
     [self.view addSubview:textView];
     NSString *htmlString = @"
     ![](http://blogs.babble.com/famecrawler/files/2010/11/mickey_mouse-1097.jpg)";
     NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData: [htmlString dataUsingEncoding:NSUnicodeStringEncoding] options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes: nil error: nil];
     textView.attributedText = attributedString;
     \
    获取collectionViewCell在屏幕中的frame
     UICollectionViewLayoutAttributes *attributes = [collectionView layoutAttributesForItemAtIndexPath:indexPath];
     CGRect cellRect = attributes.frame;
     CGRect cellFrameInSuperview = [collectionView convertRect:cellRect toView:[cv superview]];
     
     */
    
}

+ (NSString *)sandBoxPath {
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [array firstObject];
    return path;
}

+ (NSMutableArray *)wordStyle {
    
    NSArray *familyNames = [UIFont familyNames];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:familyNames];
    
    NSMutableArray *detailArray = [NSMutableArray array];
    for (NSString *familyName in familyNames) {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        [detailArray addObject:fontNames];
    }
    [array addObject:detailArray];
    
    return array;
}

+ (UIColor *)tinColor {
   UIColor *color = [UIColor colorWithRed:((float)((0x448bfc & 0xFF0000) >> 16))/255.0 green:((float)((0x448bfc & 0xFF00) >> 8))/255.0 blue:((float)(0x448bfc & 0xFF))/255.0 alpha:1.0];
    return color;
}

+ (UIFont *)tinFontSize:(NSInteger)type {
    
    NSString *name = [self tinFontName];
    
    CGFloat size = [self textFont:type];
    
    if (name && name.length) {
        return [UIFont fontWithName:name size:size];
    }
    
    return [UIFont systemFontOfSize:size];
}

+ (CGFloat)textFont:(NSInteger)type {
    
    if (type == 0) {
        return 18;
    } else if (type == 1) {
        return 16;
    } else if (type == 2) {
        return 14;
    } else if (type == 3) {
        return 12;
    } else if (type == 4) {
        return 11;
    } else if (type == 5) {
        return 10;
    }
    
    return 17;
}

+ (NSString *)tinFontName {
    return @"PingFangTC-Regular";
}

+ (NSString *)getDeviceInfo {
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([platform isEqualToString:@"iPhone9,1"])    return @"国行、日版、港行iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"])    return @"港行、国行iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,3"])    return @"美版、台版iPhone 7";
    if ([platform isEqualToString:@"iPhone9,4"])    return @"美版、台版iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"]) return @"iPad 1G";
    if ([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"]) return @"iPad Mini 2G";
    if ([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    return platform;
}

#pragma mark - <网络图片的 size >
+ (CGSize)downloadImageSizeWithURL:(id)imageURL {
    NSURL* URL = nil;
    if([imageURL isKindOfClass:[NSURL class]]){
        
        URL = imageURL;
    }
    
    if([imageURL isKindOfClass:[NSString class]]){
        
        URL = [NSURL URLWithString:imageURL];
        
    }
    
    if(URL == nil)
        
        return CGSizeZero;
    
#ifdef dispatch_main_sync_safe
    
    if([[SDImageCache sharedImageCache] diskImageExistsWithKey:absoluteString])
        
    {
        
        UIImage* image = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:absoluteString];
        
        if(!image)
            
        {
            
            NSData* data = [[SDImageCache sharedImageCache] performSelector:@selector(diskImageDataBySearchingAllPathsForKey:) withObject:URL.absoluteString];
            
            image = [UIImage imageWithData:data];
            
        }
        
        if(image)
            
        {
            
            return image.size;
            
        }
        
    }
    
#endif
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1];
    
    
    
    NSString* pathExtendsion = [URL.pathExtension lowercaseString];
    
    CGSize size = CGSizeZero;
    
    if ([pathExtendsion rangeOfString:@"png"].location != NSNotFound) {
        
        size = [self downloadPNGImageSizeWithRequest:request];
        
    }
    
    else if([pathExtendsion rangeOfString:@"gif"].location != NSNotFound)
        
    {
        
        size = [self downloadGIFImageSizeWithRequest:request];
        
    }
    
    else{
        
        size = [self downloadJPGImageSizeWithRequest:request];
        
    }
    
    if(CGSizeEqualToSize(CGSizeZero, size))
        
    {
        
        NSData* data = [NSData dataWithContentsOfURL:URL];
        
        UIImage* image = [UIImage imageWithData:data];
        
        if(image)
            
        {
            
            //如果未使用SDWebImage，则忽略；缓存该图片
            
#ifdef dispatch_main_sync_safe
            
            [[SDImageCache sharedImageCache] storeImage:image recalculateFromImage:YES imageData:data forKey:URL.absoluteString toDisk:YES];
            
#endif
            
            size = image.size;
            
        }
        
    }
    
    //过滤掉不符合大小的图片，大图太大浪费流量，用户体验不好
    
    if (size.height > 2048 || size.height <= 0 || size.width > 2048 || size.width <= 0 ) {
        
        return CGSizeZero;
        
    }
    
    else
        
    {
        
        return size;
        
    }
    
}

+ (CGSize)downloadPNGImageSizeWithRequest:(NSMutableURLRequest*)request

{
    
    [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if(data.length == 8)
        
    {
        
        int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
        
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        
        [data getBytes:&w3 range:NSMakeRange(2, 1)];
        
        [data getBytes:&w4 range:NSMakeRange(3, 1)];
        
        int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
        
        int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
        
        [data getBytes:&h1 range:NSMakeRange(4, 1)];
        
        [data getBytes:&h2 range:NSMakeRange(5, 1)];
        
        [data getBytes:&h3 range:NSMakeRange(6, 1)];
        
        [data getBytes:&h4 range:NSMakeRange(7, 1)];
        
        int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
        
        return CGSizeMake(w, h);
        
    }
    
    return CGSizeZero;
    
}

+ (CGSize)downloadGIFImageSizeWithRequest:(NSMutableURLRequest*)request

{
    
    [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if(data.length == 4)
        
    {
        
        short w1 = 0, w2 = 0;
        
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        
        short w = w1 + (w2 << 8);
        
        short h1 = 0, h2 = 0;
        
        [data getBytes:&h1 range:NSMakeRange(2, 1)];
        
        [data getBytes:&h2 range:NSMakeRange(3, 1)];
        
        short h = h1 + (h2 << 8);
        
        return CGSizeMake(w, h);
        
    }
    
    return CGSizeZero;
    
}

+ (CGSize)downloadJPGImageSizeWithRequest:(NSMutableURLRequest*)request

{
    
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    
    
    if ([data length] <= 0x58) {
        
        return CGSizeZero;
        
    }
    
    if ([data length] < 210) {// 肯定只有一个DQT字段
        
        short w1 = 0, w2 = 0;
        
        [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
        
        [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
        
        short w = (w1 << 8) + w2;
        
        short h1 = 0, h2 = 0;
        
        [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
        
        [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
        
        short h = (h1 << 8) + h2;
        
        return CGSizeMake(w, h);
        
    } else {
        
        short word = 0x0;
        
        [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
        
        if (word == 0xdb) {
            
            [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
            
            if (word == 0xdb) {// 两个DQT字段
                
                short w1 = 0, w2 = 0;
                
                [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                
                [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                
                short w = (w1 << 8) + w2;
                
                short h1 = 0, h2 = 0;
                
                [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                
                [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                
                short h = (h1 << 8) + h2;
                
                return CGSizeMake(w, h);
                
            } else {// 一个DQT字段
                
                short w1 = 0, w2 = 0;
                
                [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                
                [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                
                short w = (w1 << 8) + w2;
                
                short h1 = 0, h2 = 0;
                
                [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                
                [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                
                short h = (h1 << 8) + h2;
                
                return CGSizeMake(w, h);
                
            }
            
        } else {
            
            return CGSizeZero;
            
        }
    }
}


+ (NSString *)toLower:(NSString *)str {
    for (NSInteger i=0; i<str.length; i++) {
        if ([str characterAtIndex:i]>='A'&[str characterAtIndex:i]<='Z') {
            //A  65  a  97
            char  temp=[str characterAtIndex:i]+32;
            NSRange range=NSMakeRange(i, 1);
            str=[str stringByReplacingCharactersInRange:range withString:[NSString stringWithFormat:@"%c",temp]];
        }
    }
    return str;
}

+ (NSString *)toUpper:(NSString *)str {
    for (NSInteger i=0; i<str.length; i++) {
        if ([str characterAtIndex:i]>='a'&[str characterAtIndex:i]<='z') {
            //A  65  a  97
            char  temp=[str characterAtIndex:i]-32;
            NSRange range=NSMakeRange(i, 1);
            str=[str stringByReplacingCharactersInRange:range withString:[NSString stringWithFormat:@"%c",temp]];
        }
    }
    return str;
}


@end
