//
//  KGHomePageViewController.m
//  KGKuGouPlayer
//
//  Created by hegf on 15/9/15.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "KGHomePageViewController.h"
#import "KGHomePageMusicTableViewCell.h"

@interface KGHomePageViewController ()
@property (weak, nonatomic) IBOutlet UIButton *icon;
- (IBAction)logon:(UIButton *)sender;
- (IBAction)signin:(UIButton *)sender;
- (IBAction)switchbtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)myMusic:(UIButton *)sender;
- (IBAction)netMusic:(UIButton *)sender;
- (IBAction)moreFunction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *arrow;
@property (weak, nonatomic) IBOutlet UIButton *netMusicButton;
@property (weak, nonatomic) IBOutlet UIButton *moreFunctionButton;
@property (weak, nonatomic) IBOutlet UIButton *myMusicButton;


@property (assign, nonatomic) NSInteger curselectedRow;


@property (strong, nonatomic) NSMutableArray* cellStatus;

@end

@implementation KGHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    _tableView.dataSource = self;
//    _tableView.delegate = self;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    //设置tabelFooterView为空，则没有文字的cell下边就不会出现分割线
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    
    //默认选中的是我的音乐
    [self myMusic:_myMusicButton];
    
    _curselectedRow = -1;
}


-(NSMutableArray *)cellStatus{
    if (_cellStatus == nil) {
        _cellStatus = [NSMutableArray array];
        for (int i=0; i<20; i++) {
            NSDictionary* dict = @{@"selected": @0};
            KGMusicCellStatus* status = [KGMusicCellStatus musicCellStatusWithDict:dict];
            [_cellStatus addObject:status];
        }
    }
    return _cellStatus;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellStatus.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    KGHomePageMusicTableViewCell* cell = [KGHomePageMusicTableViewCell homePageMusicTableViewCellWithTableView:tableView];
    cell.textLabel.text = @"TEST";
    cell.status = self.cellStatus[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_curselectedRow >= 0) {
        KGMusicCellStatus* oldstatus = self.cellStatus[_curselectedRow];
        oldstatus.selected = NO;
    }
    KGMusicCellStatus* status = self.cellStatus[indexPath.row];
    status.selected = YES;
    
    _curselectedRow = indexPath.row;
    
    [self.tableView reloadData];
}


-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 登录
- (IBAction)logon:(UIButton *)sender {
    
}
#pragma mark 注册
- (IBAction)signin:(UIButton *)sender {
    
}

#pragma mark 按钮切换
- (IBAction)switchbtn:(UIButton *)sender {
    sender.selected = !sender.selected;
}

#pragma mark 我的音乐
- (IBAction)myMusic:(UIButton *)sender {
    sender.selected = YES;
    _netMusicButton.selected = NO;
    _moreFunctionButton.selected = NO;
    
}

#pragma mark 网络音乐
- (IBAction)netMusic:(UIButton *)sender {
    sender.selected = YES;
    _myMusicButton.selected = NO;
    _moreFunctionButton.selected = NO;

}

#pragma mark 更多功能
- (IBAction)moreFunction:(UIButton *)sender {
    sender.selected = YES;
    _netMusicButton.selected = NO;
    _myMusicButton.selected = NO;

}
@end
