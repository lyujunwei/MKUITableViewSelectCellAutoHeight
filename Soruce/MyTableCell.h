//
//  MyTableCell.h
//  MKUITableViewAutoCellHeight
//
//  Created by zucknet on 13/3/23.
//  Copyright (c) 2013年 zucknet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableCell : UITableViewCell{
    IBOutlet UILabel *myLab;
    IBOutlet UIView *myView;
    IBOutlet UIImageView *myImg;
}

@property(nonatomic,strong)UILabel *myLab;
@property(nonatomic,strong)UIView *myView;
@property(nonatomic,strong)IBOutlet UIImageView *myImg;

@end
