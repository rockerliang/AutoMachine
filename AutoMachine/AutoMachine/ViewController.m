//
//  ViewController.m
//  AutoMachine
//
//  Created by Rocker on 2018/6/27.
//  Copyright © 2018年 Rocker. All rights reserved.
//

#import "ViewController.h"
#import "BEHttpRequest.h"
#import <CommonCrypto/CommonDigest.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testGet];
}

-(void)testGet
{
    NSString *urlStr = @"https://api.bit-z.com/api_v1/tradeAdd";
    
    NSString *api_key = @"";
    NSString *secret_key = @"";
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a];
    
    NSString *strRandom = @"";
    for(int i=0; i<6; i++)
    {
        strRandom = [ strRandom stringByAppendingFormat:@"%i",(arc4random() % 9)];
    }
    
    NSString *signStr = [NSString stringWithFormat:@"api_key=%@&coin=btc_usdt&nonce=%@&number=0.01&price=100000&timestamp=%@&tradepwd=rockerliang&type=out%@",strRandom,api_key,timeString,secret_key];
    NSString *md5Sign = [self md5:signStr];

    
    NSDictionary *dic = @{@"api_key":api_key,
                          @"timestamp":timeString,
                          @"nonce":strRandom,
                          @"type":@"out",
                          @"price":@"100000",
                          @"number":@"0.01",
                          @"coin":@"btc_usdt",
                          @"tradepwd":@"rockerliang",
                          @"sign":md5Sign
                          };
    
    [BEHttpRequest PostWithURL:urlStr Params:dic success:^(id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSString *error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** * 32位md5加密算法 * * @param str 传入要加密的字符串 * * @return NSString */
- (NSString *)md5:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return
    [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15] ];

}
    
    


@end
