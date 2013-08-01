//
//  EditableTableViewCell.m
//  Todo
//  Creates an editbale cell with a text lable. 
//
//  Created by Seema Kamath on 8/1/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\seemakam. All rights reserved.
//

#import "EditableTableViewCell.h"

@implementation EditableTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.textLabel.text = @"Yaay";
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
