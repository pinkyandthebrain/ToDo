//
//  TempViewController.m
//  TemperatureConverter
//
//  Created by Seema Kamath on 7/24/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\seemakam. All rights reserved.
//

#import "TempViewController.h"
#import "constants.h"


@interface TempViewController ()

- (void) updateValues;

@end

@implementation TempViewController
{
@private
    BOOL isFahreniteField; //keeps track of which field was edited when done was pressed
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fahrenhiteField.delegate = (id) self;
    self.celsiusField.delegate = (id) self;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton)];
    
    [self.convertButton addTarget:self action:@selector(updateValues) forControlEvents:UIControlEventAllTouchEvents];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField Delegates


- (BOOL) textFieldShouldBeginEditing: (UITextField *) textField{
    
    //Reset the text fields
    self.celsiusField.text=nil;
    self.fahrenhiteField.text=nil;
    
    return YES;
}


- (BOOL) textFieldShouldEndEditing: (UITextField *) textField{
    
    if(textField.tag == FAHRENHITE_TAG){

#if DEBUG_TC
        NSLog(@"Fahrenhite Field");
#endif
        isFahreniteField = TRUE;
    }else if(textField.tag  == CELSIUS_TAG){
#if DEBUG_TC
        NSLog(@"Celsius Field");
#endif
        isFahreniteField = FALSE;
    }
    
    return YES;
}



#pragma mark - Private methods

-(void)onDoneButton {
    [self.view endEditing:YES];
}


//

- (void) updateValues {
    
    if (isFahreniteField == FALSE){
        float celsius = [self.celsiusField.text floatValue];
        float tempInFahrenhite = celsius*9/5 + 32 ;
        self.fahrenhiteField.text = [NSString stringWithFormat:@"%0.2f F", tempInFahrenhite];
    }else if(isFahreniteField == TRUE){
        float fahrenhite = [self.fahrenhiteField.text floatValue];
        float tempInCelsius = (fahrenhite-32)*5/9 ;
        self.celsiusField.text = [NSString stringWithFormat:@"%0.2f C", tempInCelsius];
        
    }
    
}

@end
