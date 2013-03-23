//
//  MyTableViewController.m
//  MKUITableViewAutoCellHeight
//
//  Created by zucknet on 13/3/23.
//  Copyright (c) 2013年 zucknet. All rights reserved.
//

#import "MyTableViewController.h"
#define originalHeight 90.0f
#define newHeight 90
#define isOpen @"90"
#import "MyTableCell.h"

@interface MyTableViewController (){
    NSMutableDictionary *dicClicked;
    NSInteger count;
    CGFloat mHeight;
    NSInteger sectionIndex;
}

@end

@implementation MyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self creatNSString];
    
    count = 0;
    mHeight = originalHeight;
    sectionIndex = 0;
    dicClicked = [NSMutableDictionary dictionaryWithCapacity:3];
}

-(void)creatNSString{
    NSString* str1 =@"苏州物华天宝，人杰地灵，被誉为“人间天堂”，素来以山水秀丽、园林典雅而闻名天下，有“江南园林甲天下，苏州园林甲江南”的美称，又因其小桥流水人家的水乡古城特色，而有“东方威尼斯”美誉。苏州自有文字记载以来的历史已有4000多年，公元前514年建城，中国重点风景旅游城市，长三角重要经济中心。苏州是江苏省第二大城市、经济最发达的城市、对外贸易、工商业和物流中心，也是重要的文化、艺术、教育和交通中心。";
    
    NSString* str2 = @"如果第一次来苏州，花上一天时间，游玩苏州的园林，还是很有必要，比如拙政园、狮子林、虎丘、盘门。如果已经来过，那大可跟着我们的步伐，寻找幽静的春色，花上半天游山塘，下午逛逛平江路。贡献一天半给西山。此外，余下的时间，可以抽空听听评弹，逛逛夜园林。苏州现有拙政园、留园、狮子林、沧浪亭、环秀山庄、艺圃、耦园、网师园、退思园等九座园林被列入《世界遗产名录》，城区另有怡园、五峰园、惠荫园等73处园林遗存。";
    
    NSString* str3 = @"苏州属亚热带季风性气候，气候温和、湿润，四季分明，全年皆宜旅游，尤以春天最佳。4~10月间玩苏州，既可欣赏到桃红柳绿的自然风光，又有品尝鲜桃、碧螺春、糖藕等、杨梅、枇杷、糖藕、大闸蟹、腌笃鲜等轮番上市，足够让游客在眼福之余大饱口福。";
    
    NSString* str4 = @"苏州位于太湖之滨，长江南岸的入海口处，苏州共辖5个市辖区：姑苏区、虎丘区（高新区）、吴中区、相城区、吴江区。代管4个县级市：昆山市、常熟市、张家港市、太仓市。";
    
    
    list = [[NSArray alloc]initWithObjects:@"苏州园林",@"太湖湿地公园",@"苏州天颐温泉",@"苏州颐舍温泉", nil];
    
    world = [[NSArray alloc]initWithObjects:str1,str2,str3,str4, nil];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *contentIndentifer = @"Container";
    
    if (indexPath.row == 0) {
        
        MyTableCell *cell = (MyTableCell *)[tableView dequeueReusableCellWithIdentifier:contentIndentifer];
        if (cell == nil) {
            cell=[[[NSBundle mainBundle] loadNibNamed:@"MyTableCell" owner:self options:nil] objectAtIndex:0];
            
            cell.myLab.text = [list objectAtIndex:indexPath.section];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.tag = 1;
            label.lineBreakMode = NSLineBreakByCharWrapping;
            label.highlightedTextColor = [UIColor whiteColor];
            label.numberOfLines = 0;
            label.opaque = NO;
            label.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:label];
        }
        
        UILabel *label = (UILabel *)[cell viewWithTag:1];
        NSString *text;
        text = [world objectAtIndex:indexPath.section];
        CGRect cellFrame = [cell frame];
        cellFrame.origin = CGPointMake(60, 30);
        
        label.text = text;
        label.font = [UIFont systemFontOfSize:12.0f];
        CGRect rect = CGRectInset(CGRectMake(cellFrame.origin.x, cellFrame.origin.y, cellFrame.size.width-60, cellFrame.size.height), 10,0);
        label.frame = rect;
        [label sizeToFit];
        if (label.frame.size.height > 46) {
            cellFrame.size.height = 50 + label.frame.size.height - 46;
        }
        else {
            cellFrame.size.height = 50;
        }
        [cell setFrame:cellFrame];
        
        if (indexPath.section == 0) {
            cell.myImg.image = [UIImage imageNamed:@"001.jpg"];
        }
        
        if (indexPath.section == 1) {
            cell.myImg.image = [UIImage imageNamed:@"002.jpg"];
        }
        
        if (indexPath.section == 2) {
            cell.myImg.image = [UIImage imageNamed:@"003.jpg"];
        }
        
        if (indexPath.section == 3) {
            cell.myImg.image = [UIImage imageNamed:@"004.jpg"];
        }
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    count++;
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (dicClicked.count == 0) {
        [dicClicked setObject:isOpen forKey:indexPath];
    }else{
        NSArray *arr = [dicClicked allKeys];
        if ([arr indexOfObject:indexPath] == NSNotFound) {
            [dicClicked setObject:isOpen forKey:indexPath];
        }else{
            [dicClicked removeObjectForKey:indexPath];
        }
    }
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    NSLog(@"indexPath=%@",indexPath);
    NSLog(@"dicClicked=%@",dicClicked);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([[dicClicked objectForKey:indexPath] isEqualToString: isOpen]) {
        UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.frame.size.height + 40;
    }
    else
        return originalHeight;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
