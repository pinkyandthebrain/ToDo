//
//  EditableTableViewCell.h
//  Todo
//
//  Created by Seema Kamath on 8/1/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\seemakam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditableTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UILabel *textLabel;

@end
