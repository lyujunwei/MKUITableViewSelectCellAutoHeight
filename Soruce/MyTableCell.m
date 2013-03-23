//
//  MyTableCell.m
//  MKUITableViewAutoCellHeight
//
//  Created by zucknet on 13/3/23.
//  Copyright (c) 2013年 zucknet. All rights reserved.
//

#import "MyTableCell.h"

@implementation MyTableCell
@synthesize myImg,myLab;
@synthesize myView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
