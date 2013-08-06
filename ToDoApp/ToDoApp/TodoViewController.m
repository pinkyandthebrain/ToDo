//
//  TodoViewController.m
//  ToDoApp
//
//  Created by Seema Kamath on 8/5/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\seemakam. All rights reserved.
//

#import "TodoViewController.h"
#import "EditableTableViewCell.h"

@interface TodoViewController ()

@property (nonatomic, strong) NSMutableArray *todoItems;

@end

@implementation TodoViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //Register the custom editabletableviewcell NIB
    UINib *customNib = [UINib nibWithNibName:@"EditableTableViewCell" bundle:nil];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"EditableTableViewCell"];
                        
    
    
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
  
    [self.todoItems addObject:@"Tap the + button to add an item"];
    [self.todoItems addObject:@"Swipe to delete items"];
    [self.todoItems addObject:@"Tap the edit button to bulk edit items"];
    
   
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 0;
}
 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.todoItems.count;
}

- (EditableTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditableTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditableTableViewCell"];
    
    if (cell == nil) {
        cell = [[EditableTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EditableTableViewCell"];
    }
    
    cell.textField.text = [self.todoItems objectAtIndex:indexPath.row];
    cell.textField.delegate = self;
   
    
   return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        [self.todoItems removeObjectAtIndex:indexPath.row];
        [self.todoTable reloadData];
        
        //Reset the editing style
        tableView.editing = NO;
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert){
        [self.todoItems insertObject:@" " atIndex:0];
        [self.todoTable reloadData];
        
        
    }
}

#if 0
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    // No editing style if not editing or the index path is nil.
	if (!indexPath) return UITableViewCellEditingStyleNone;
	
    if ([self.todoItems objectAtIndex:indexPath.row] == nil) return UITableViewCellEditingStyleInsert;
    
	// No editing style if the tableView has no cells.
	if ([self.todoItems count] == 0) return UITableViewCellEditingStyleNone;
	
	// If tableView is not editing, then return delete button.
	if (tableView.editing == NO) return UITableViewCellEditingStyleDelete;
	
	// If tableView is editing, then return delete button too.
	if (tableView.editing == YES) return UITableViewCellEditingStyleDelete;
	
	// If none of the above are returned, then return \"none\".
	return UITableViewCellEditingStyleNone;
}
#endif

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *stringToMove = [self.todoItems objectAtIndex:fromIndexPath.row];
    [self.todoItems removeObjectAtIndex:fromIndexPath.row];
    [self.todoItems insertObject:stringToMove atIndex:toIndexPath.row];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView.style == UITableViewCellEditingStyleDelete){
        return NO;
    }
    return YES;
}


#pragma mark - UITextField Delegates


- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    self.todoItems[0] = textField.text;
    self.navigationItem.rightBarButtonItem.enabled = YES;
    
    [textField resignFirstResponder];
    
    return YES;
    
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    self.todoItems[0] = textField.text;
    //Disable the add button so you don't get into a funky state. Add an improvement to save the current item and add a new row at the top
    self.navigationItem.rightBarButtonItem.enabled = YES;
    
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    return YES;
}

#pragma mark - Private methods


- (void) onAddButton
{
    //Make sure that the table is not in editable mode
    self.editing = NO;
    //Insert an object at the top of the table
    [self.todoItems insertObject:@" " atIndex:0];
    [self.tableView reloadData];
    NSIndexPath *indexPath = [ NSIndexPath indexPathForRow:0 inSection:0];
    EditableTableViewCell *cell = (EditableTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    [cell.textField becomeFirstResponder];
    
    
    
    
}

- (void) onEditButton
{
    if([self.navigationItem.leftBarButtonItem.title isEqualToString:@"Edit"]){
        self.editing = YES;
        self.navigationItem.leftBarButtonItem.title = @"Done";
    }else{
        self.editing = NO;
        self.navigationItem.leftBarButtonItem.title =@"Edit";
        
    }
    
}



@end
