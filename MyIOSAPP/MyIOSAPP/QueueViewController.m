//
//  QueueViewController.m
//  MyIOSAPP
//
//  Created by river on 2018/2/22.
//  Copyright © 2018年 river. All rights reserved.
//

#import "QueueViewController.h"

@interface QueueViewController ()

@end

@implementation QueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"NSInvocationOperation开始" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.layer.borderColor = [UIColor blackColor].CGColor;
    button1.layer.borderWidth = 0.5;
//    button1.center = CGPointMake(100, 30);
    button1.frame = CGRectMake(100, 100, 200, 40);
    [button1 addTarget:self action:@selector(start1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
//
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"NSBlockOperation开始" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.layer.borderColor = [UIColor blackColor].CGColor;
    button2.layer.borderWidth = 0.5;
    button2.frame = CGRectMake(100, 150, 200, 40);
    [button2 addTarget:self action:@selector(start2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"NSOperationQueue开始" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button3.layer.borderColor = [UIColor blackColor].CGColor;
    button3.layer.borderWidth = 0.5;
    button3.frame = CGRectMake(100, 200, 200, 40);
    [button3 addTarget:self action:@selector(start3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
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
/**
 NSOperation是个抽象类，并不能封装任务。我们只有使用它的子类来封装任务。我们有三种方式来封装任务。
 1.使用子类NSInvocationOperation
 2.使用子类NSBlockOperation
 3.定义继承自NSOperation的子类，通过实现内部相应的方法来封装任务。
  **/
//使用NSInvocationOperation 创建线程
-(void)start1{
    NSInvocationOperation * invocationOp = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationOpRun) object:nil];
    [invocationOp start];
    
}

//NSInvocationOperation Start
-(void)invocationOpRun{
    NSLog(@"-----------: %@",[NSThread currentThread]);
    //在没有使用NSOperationQueue、单独使用NSInvocationOperation的情况下，NSInvocationOperation在主线程执行操作，并没有开启新线程。
}
//使用NSBlockOperation创建线程
-(void)start2{
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        // 在主线程
        NSLog(@"1------%@", [NSThread currentThread]);
    }];
    
    //在没有使用NSOperationQueue、单独使用NSBlockOperation的情况下，NSBlockOperation也是在主线程执行操作，并没有开启新线程。
    //但是，NSBlockOperation还提供了一个方法addExecutionBlock:，通过addExecutionBlock:就可以为NSBlockOperation添加额外的操作，这些额外的操作就会在其他线程并发执行。
    // 添加额外的任务(在子线程执行)
    [op addExecutionBlock:^{
        NSLog(@"2------%@", [NSThread currentThread]);
    }];
    [op addExecutionBlock:^{
        NSLog(@"3------%@", [NSThread currentThread]);
    }];
    [op addExecutionBlock:^{
        NSLog(@"4------%@", [NSThread currentThread]);
    }];
    
    [op start];
    
   //可以看出，blockOperationWithBlock:方法中的操作是在主线程中执行的，而addExecutionBlock:方法中的操作是在其他线程中执行的。
    
}

//使用NSOperationQueue 创建队列
-(void)start3{
   /* NSOperation需要配合NSOperationQueue来实现多线程。
    那么我们需要将创建好的任务加入到队列中去。总共有两种方法
    */
    //1.- (void)addOperation:(NSOperation *)op;
   // 需要先创建任务，再将创建好的任务加入到创建好的队列中去
    // 1）.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2）. 创建操作
    // 创建NSInvocationOperation
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];
    // 创建NSBlockOperation
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"1-----%@", [NSThread currentThread]);
        }
    }];
    
    // 3）. 添加操作到队列中：addOperation:
    [queue addOperation:op1]; // [op1 start]
    [queue addOperation:op2]; // [op2 start]
    //NSInvocationOperation和NSOperationQueue结合后能够开启新线程，进行并发执行NSBlockOperation和NSOperationQueue也能够开启新线程，进行并发执行。
    
    //2.- (void)addOperationWithBlock:(void (^)(void))block;无需先创建任务，在block中添加任务，直接将任务block加入到队列中。
    
    [self addOperationWithBlockToQueue];
    

}
- (void)run
{
    for (int i = 0; i < 2; ++i) {
        NSLog(@"2-----%@", [NSThread currentThread]);
    }
}

-(void)addOperationWithBlockToQueue{
    // 1. 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2. 添加操作到队列中：addOperationWithBlock:
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"44-----%@", [NSThread currentThread]);
        }
    }];
    
}

@end
