//
//  ViewController.m
//  3Done
//
//  Created by gjh on 2016/11/3.
//  Copyright © 2016年 gjh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIDocumentInteractionControllerDelegate>

@end

@implementation ViewController{
    NSString *filePath;    // 模型文件路径
    UIDocumentInteractionController *documentController; // 以预览的方式打开
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 25)];
    [button setTitle:@"Go UPStudio" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goUPStudio:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor greenColor]];
    button.center = self.view.center;
    [self.view addSubview:button];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/test.stl"];
    NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"1" ofType:@"stl"];
    NSData *saveData = [NSData dataWithContentsOfFile:bundlePath];
    
    BOOL saveFileCallBack =  [saveData writeToFile:filePath atomically:YES];
    if (saveFileCallBack) {
        NSLog(@"filePath:%@",filePath);
    }else
        NSLog(@"save fail!");
    
}


-(void)goUPStudio:(UIButton *)btn
{
    if (filePath.length>0) {
        // filePath 你想要用其他应用打开的文件路径
        documentController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:filePath]];
        documentController.delegate = self;
        // .UTI 表示所能支持的第三方文件打开的类型
        documentController.UTI = @"com.sunsetlakesoftware.molecules.stl";
        // 弹出的试图的样式儿可以自定义
        [documentController presentOpenInMenuFromRect:CGRectMake(760, 20, 100, 100) inView:self.view animated:YES];
    }else
        NSLog(@"未找到文件，文件不存在!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
