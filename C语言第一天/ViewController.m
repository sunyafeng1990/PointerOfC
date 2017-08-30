//
//  ViewController.m
//  C语言第一天
//
//  Created by 孙亚锋 on 2017/8/21.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "ViewController.h"
/*
 * 宏MIN，输入2个参数,并返回较小的一个。
 */
#define SunMIN(A, B)  ((A)<(B) ? (A):(B))

//只要有引用类，runtime 就会自动去调用类的 load 方法。
//#import "People.h"

@interface ViewController ()

//property 本质：
// ivar(实例变量) + getter(取方法) + setter(存方法)
@property(nonatomic,strong)UILabel *labe;


// 这个写法有2个问题：
// 1、没有指明 nonatomic，因此就是 atomic原子操作,会影响性能。
// 2、因为使用的是copy,所以得到的实际是 NSArray 类型,它是不可变的,若在使用中使用了 增、删、改 操作,则会 crash。
@property(copy) NSMutableArray *array;
/*
最本质的一个区别就是默认的访问控制：
默认的继承访问权限
struct是public的，class是private的。
 类可以继承
 类可以内省和转型
 struct、enum为值类型，class为引用类型
 类方法用class关键词声明，enum、struct用static关键词
 用mutaing关键词声明要修改struct、enum内容的方法
 结构体适合基本数据类型
*/
struct myDate {
    int year;
    int month;
    int day;
    
};


struct student{
    int a;
    int b;
    int c;
    
};

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

//    [self test];
    
//    [self test1];
    
//    [self test2];
    
//    [self test4];
    
//    [self test5];
    
    
    [self blockTest];
}
- (void)test5{
    
    int* px = (int*)10;
    int** px2 = (int**)11;
    int*** px3 = (int***)12;
    int**** px4 = (int****)13;
    
//  把px 值取出来
    
//    *(px) 是什么类型？
    int x = 10;
   
//    int y = *x;//x 变量想加* ,变量原来的类型没有*，就不能加*
//     &x;// == int*  取X 变量 地址
    int* xx = &x;
    
    char x1 = *xx;
    
//   *x 和 &x 正好相反
}
//
-(void)test4{
//  & 是地址符， 任何一个变量类型都可以使用&来获取地址
    
    char a = 10;
    short b = 20;
    int c = 30;
//    &a 的类型就是 a 的类型 + *
//    &a  == shar*
//    &b  == short*
//    &c  == int*
    char**** aa = (char****)10;
//    &aa = char***** //注意这里是5个*
    
    char* pa  = &a;
    short* pb = &b;
    int* pc   = &c;
    
    
    char** ppa = &pa;
    short**ppb = &pb;
    int** ppc  = &pc;
    
}
// * 指针 大小比较
-(void)test2{
    
    char**** a;
    char**** b;
    a = (char****)200;
    b = (char****)100;
    
    if (a>b) {
        
        NSLog(@"1");
    }else{
        NSLog(@"2");
    }
    /*
     总结：  带 *  的变量，如果类型相同，可以做大小的比较。
     */
    
    
    
    int x = 10;
    //转型
    char y = (char)x;
    
    
    
    
}
/// c 指针 学习
- (void)test {
    char* x;
    short* y;
    int* z;
// 1、带有 * 的变量类型的标准写法  : int* a;
// 2、任何 类型 都可以带 *
// 3、 * 可以是任意多个
// 4、带一个* 和 带多个* 性质是不一样的
// 5、不管什么类型,只要加了 * ，不管带了几个 * ，宽度都是只有4个字节，
    x = (char*)100;
    y = (short*)100;
    z = (int*)100;
//  当 带*号的  进行++/-- 的时候，
    x++;
    y++;
    z++;
    
//    NSLog(@"-->%d,--->%d,--->%d",x,y,z);-->101,--->102,--->104
    
    
    char* a;
    short* b;
    int* c;
    a = (char*)100;
    b = (short*)100;
    c = (int*)100;
    a = a + 5;
    b = b + 5;
    c = c + 5;
//    char 1个字节  short 2个字节  int 4个字节
//    NSLog(@"%d  %d  %d ",a,b,c);105  110  120
    
    char**** d;
    short**** e;
    int**** f;
 
    d = (char****)100;
    e = (short****)100;
    f = (int****)100;
    
    d = d + 5;
    e = e + 5;
    f = f + 5;
//    NSLog(@"%d  %d  %d ",d,e,f); 140  140  140 
    
   /*
    总结：
     有多个* 的时候，减去一个*，看看还剩下几个，如果有1个或多个，字节宽度都是 4个字节。
     带 * 类型的 不能进行 乘除。
     完全相同的类型 才可以相加、相减。
    */
    
    char* g;
    char* h;
    g = (char*)200;
    h = (char*)100;
    
    int l = g - h ;
    NSLog(@"%d",l );
    
    
}
-(void)test1{
    
    struct myDate date = {1990,7,11};
    NSLog(@"date- %d/%d/%d",date.year,date.month,date.day);
    
    
    NSLog(@"%d",SunMIN(8, 6));
    
    //    只有使用类,才会调用 initialize 方法
//        People * peo = [[People alloc]init];
 
    
    int arr[5] = {1,2,3,4,5};
    //P 指针指向了数组arr的首地址，也就是第一个元素对应的地址，其值为1
    int *p = &arr[0];
    
    int max = MAX(*p++, 1);
    // 等于
    //    int max1 = (*p++) >(1) ? (*p++):(1);
    // 继续分析
    //    (1) > (1) ? (*p++):(1);
    
    //    第一个*p++的结果就是,p所指向的值变成了2,但是1>1 为值，所以最终max的值就是1.而后面的 （*p++）也就不会执行，因为P所指向的地址对应的值就是2，而不是3
    NSLog(@"%d  %d",max,*p);
    
    
    
    ////随便写一个
    int array[5] = {5,9,2,4,1};
    
    int *i = &array[3];
    NSLog(@"%d",*i);
    int max2 = MAX(*(++i),1);
    
    NSLog(@"%d %d",max2,*i);

}
// __block __weak 修饰符 区别
// 1、__block arc/mrc 环境下 都能用，可以修饰对象，也能修饰基本数据类型
// 2、__weak 只能在 ARC 环境下使用,只能修饰对象（NSString）,不能修饰基本数据类型（NSInteger）
// 3、__block 对象可以在 block 中重新赋值，weak 不行。
- (void)blockTest{
    __block int a = 10;
    void(^myBlock)() = ^{
        a = 11;
    };
    myBlock();
    NSLog(@"a---%d",a);
}

@end
