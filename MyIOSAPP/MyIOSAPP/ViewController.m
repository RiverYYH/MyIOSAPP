//
//  ViewController.m
//  MyIOSAPP
//
//  Created by river on 2017/12/28.
//  Copyright © 2017年 river. All rights reserved.
//
#import <CoreText/CoreText.h>
#import "ViewController.h"
#import "ModelDesignViewController.h"
#import "UpLoadImageViewController.h"
#import "QueueViewController.h"
#import "AlertUpdateMessageViewController.h"
#import "NSString+Additions.h"
#import "CutomTableViewController.h"
#import "JSCoreViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray * dataArray;
//@property (nonatomic,strong) UIButton * barRightBtn;
@end

@implementation ViewController

- (NSArray *)getLinesArrayOfStringInLabel:(UILabel *)label{
    NSString *text = [label text];
    UIFont *font = [label font];
    CGRect rect = [label frame];
    
    CTFontRef myFont = CTFontCreateWithName(( CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge  id)myFont range:NSMakeRange(0, attStr.length)];
    CFRelease(myFont);
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(( CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,100000));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef = (__bridge  CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [text substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithInt:0.0]));
        [linesArray addObject:lineString];
    }
    
    CGPathRelease(path);
    CFRelease( frame );
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"我的APP";
    self.dataArray = [NSMutableArray arrayWithObjects:@"设计模式",@"多张图片上传",@"多线程NSOperationQueue",@"App有版本更新时候打开出现的提示",@"自定义TableVieCell", @"简单使用JsCore实现js与ios交互",nil];
    self.myTableView.tableFooterView = [[UIView alloc] init];
    
    
//    self.barRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.barRightBtn.frame = CGRectMake(WIDTH-20, 30, 80, 30);
//    [self.barRightBtn setTitle:@"停止扫描" forState:UIControlStateNormal];
//    [self.barRightBtn setTitle:@"开始扫描" forState:UIControlStateSelected];
//
//    [self.barRightBtn setTitleColor:BLUECOLOR forState:UIControlStateNormal];
//    self.barRightBtn.titleLabel.font = [UIFont systemFontOfSize:18];
//    [[self.barRightBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        self.barRightBtn.selected = !self.barRightBtn.selected;
//
//        if (self.barRightBtn.selected) {
//            [self endScanIbeacon];
//        }else{
//            [self startScanIbecan];
//        }
//    }];
//
//    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:self.barRightBtn];
//    self.navigationItem.rightBarButtonItem = barBtn;
//

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- UITableViewDelegate and UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"cellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    UILabel * titleLb = [[UILabel alloc] initWithFrame:CGRectMake(20, 2, cell.contentView.frame.size.width, 58)];
    titleLb.text = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.row]];
    [cell.contentView addSubview:titleLb];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.row) {
        case 0:
        {
            ModelDesignViewController * modelDesign = [ModelDesignViewController new];
            [self.navigationController pushViewController:modelDesign animated:YES];
            
        }
            break;
        case 1:{
            UpLoadImageViewController * upLoadImage = [UpLoadImageViewController new];
            [self.navigationController pushViewController:upLoadImage animated:YES];
        }
            break;
        case 2:{
            QueueViewController * queueView = [QueueViewController new];
            [self.navigationController pushViewController:queueView animated:YES];
            
        }break;
        case 3:{
            AlertUpdateMessageViewController * alerMessage = [AlertUpdateMessageViewController new];
            [self.navigationController pushViewController:alerMessage animated:YES];
        }break;
        case 4:{
            CutomTableViewController * cutomTable = [CutomTableViewController new];
            [self.navigationController pushViewController:cutomTable animated:YES];
            
        }break;
        case 5:{
            JSCoreViewController * jsCoreView = [JSCoreViewController new];
            [self.navigationController pushViewController:jsCoreView animated:YES];
            
        }break;
        default:
            break;
    }
    
}

@end
