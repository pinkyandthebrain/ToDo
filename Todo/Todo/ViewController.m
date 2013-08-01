//
//  ViewController.m
//  Todo
//
//  Created by Seema Kamath on 7/31/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\seemakam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *todoItems;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"TODO";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(onAddButton)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onEditButton)];
    //self.todoItems = @[@"Tap the + button to add items", @"Swipe to delete", @"Tap edit button to bulk delete"];
    if(self.todoItems == nil)
    {
        self.todoItems = [[NSMutableArray alloc] init];
    }
    //Check to see how to store the items across launches
    //Add some default text to the to-do list
    [self.todoItems addObject:@"Tap the + button to add items"];
    [self.todoItems addObject:@"Swipe to delete"];
    [self.todoItems addObject:@"Tap edit to edit items"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource delegates

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.todoItems.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"items"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"items"];
    }
    
    cell.textLabel.text = [self.todoItems objectAtIndex:indexPath.row];
    return cell;
    
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        [self.todoItems removeObjectAtIndex:indexPath.row];
        [self.todoTable reloadData];
        
    }
}

#pragma mark - Private methods


- (void) onAddButton
{
    [self.todoItems insertObject:@"" atIndex:0];
    [self.todoTable reloadData];

    
}

- (void) onEditButton
{
    
}

@end
