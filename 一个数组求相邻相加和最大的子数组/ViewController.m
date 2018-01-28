//
//  ViewController.m
//  一个数组求相邻相加和最大的子数组
//
//  Created by lixiaoqiang on 2018/1/28.
//  Copyright © 2018年 lixiaoqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr = @[@"1",@"2",@"5",@"-30",@"50",@"-9",@"-8"];
    [self function1WithArray:arr];
    [self function2WithArray:arr];
}
//方法一
- (void)function1WithArray:(NSArray*)arr
{
    NSInteger max = [arr[0] intValue];
    NSInteger indexofi = 0;
    NSInteger indexofj = 0;
    for (NSInteger i = 0; i < arr.count; i ++) {
        for (NSInteger j = i; j < arr.count; j ++) {
            NSInteger sum = [self getSumi:i j:j andArray:arr];
            if (sum > max) {
                max = sum;
                indexofi = i;
                indexofj = j;
            }
        }
    }
    NSMutableArray *marr  = [NSMutableArray array];
    for (NSInteger index = indexofi; index <= indexofj; index ++) {
        [marr addObject:arr[index]];
    }
    NSLog(@"和最大的数组%@",marr);
}
- (NSInteger)getSumi:(NSInteger)iIndex j:(NSInteger)jIndex andArray:(NSArray*)arr
{
    NSInteger sum = 0;
    for(NSInteger  i = iIndex; i<=jIndex; i ++) {
        sum += [arr[i] integerValue];
    }
    return sum;
}

//方法二

//
- (void)function2WithArray:(NSArray*)arr
{
    if (arr == NULL ||arr.count < 1) {
        return;
    }
    NSInteger MAX = NSIntegerMin;
    NSInteger curMax = 0;
    NSMutableArray *resultArr = [NSMutableArray array];
    NSArray *arr1 = [NSArray array];
    for (NSInteger i = 0; i < arr.count; i ++) {
        if (curMax <= 0) {
            curMax = [arr[i] integerValue];
        }
        else{
            curMax += [arr[i] integerValue];
        }
        if (MAX < curMax) {
            MAX = curMax;
            [resultArr addObject:arr[i]];
             arr1 = [resultArr copy];
        }else
        {
            [resultArr removeAllObjects];
        }
    }
    NSLog(@"结果数组%@",arr1);
}
@end
