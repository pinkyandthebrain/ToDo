//
//  TodoViewController.h
//  ToDoApp
//
//  Created by Seema Kamath on 8/5/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\seemakam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITableView *todoTable;

@end
