//
//  main.m
//  C语言第一天
//
//  Created by 孙亚锋 on 2017/8/21.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}



/*
//标准的C语言函数
void plus(){
    
       printf("xxxxx");
}



 //裸函数：
void __declspec(naked) plus()
{
    __asm {
        return
    }
}


int __has_declspec(naked) plus(intx,int y)
{
 __asm
    {
//        参数
//        局部变量
//        堆栈图
    }
    
}
 */








