//
//  ViewController.m
//  qq
//
//  Created by csdc-iMac on 2018/7/24.
//  Copyright © 2018年 K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSMutableArray *groupArray;
@property NSMutableArray *detailArray;
@property NSMutableArray *isOpenArray;
@property UITableView *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"qq";
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    self.table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    
    self.table.delegate=self;
    self.table.dataSource=self;
    _groupArray=[[NSMutableArray alloc]initWithObjects:@"好友",@"家人",@"同学",@"黑名单", nil];
    
    _detailArray=[[NSMutableArray alloc]initWithObjects:@[@"1",@"2",@"3",@"4"],@[@"12",@"13"],@[@"15",@"16"],@[@"18",@"27"], nil];
    
    _isOpenArray=[[NSMutableArray alloc]init];
    for(int i=0;i<_groupArray.count;i++){
        [_isOpenArray addObject:@"0"];
    }

//    UIButton *bt=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//    [bt setImage:[UIImage imageNamed:@"11"] forState:UIControlStateNormal];
//    [bt addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:bt];
//    self.navigationItem.rightBarButtonItem=right;

    
    [self.view addSubview:self.table];
    // Do any additional setup after loading the view, typically from a nib.
}

//-(void)jump{
//
//    ViewController *next=[[ViewController alloc ]init];
//     self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
//    [self.navigationController pushViewController:next animated:YES];
//
//
//
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _groupArray.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if([_isOpenArray[section] isEqualToString:@"1"])
    {   NSMutableArray *array=_detailArray[section];
        return array.count;}
    else
        return 0;
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *v=[[UIView  alloc]init];
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(60, 0, self.view.bounds.size.width, 60)];
    lab.text=_groupArray[section];
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    img.image=[UIImage imageNamed:@"11"];
    if([_isOpenArray[section] isEqualToString:@"1"]){
        img.transform=CGAffineTransformMakeRotation(M_PI_2);//展开
    }
    v.tag=section;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapp: )];
   
    [v addSubview:lab];
    [v addSubview:img];
    [v addGestureRecognizer:tap]; //给v加手势识别
    return v;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *st=@"st";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:st];
    
   
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:st];
        
    }
    
    NSArray *ar=_detailArray[indexPath.section];
    cell.textLabel.text=ar[indexPath.row];
    return cell;
}

-(void)tapp:(UITapGestureRecognizer*)tap{
    NSInteger i=tap.view.tag;
    
        if([_isOpenArray[i] isEqualToString:@"1"]){
            [_isOpenArray replaceObjectAtIndex:i withObject:@"0"];
        
        }else{
            [_isOpenArray replaceObjectAtIndex:i withObject:@"1"];
        }
    [self.table reloadData];//重新装载数据
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
