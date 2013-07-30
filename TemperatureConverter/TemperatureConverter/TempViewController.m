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

@property (nonatomic, assign) BOOL isFahrenheitField; //keeps track of which field was edited when done was pressed
- (void) updateValues;

@end

@implementation TempViewController

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
    self.fahrenheitField.delegate = self;
    self.celsiusField.delegate = self;
    
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone //target:self action:@selector(onDoneButton)];
    
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
    self.fahrenheitField.text=nil;
    
    return YES;
}


- (BOOL) textFieldShouldEndEditing: (UITextField *) textField{
    
    if(textField.tag == FAHRENHEIT_TAG){

#if DEBUG_TC
        NSLog(@"Fahrenheit Field");
#endif
        //pretty format the input
        self.fahrenheitField.text = [NSString stringWithFormat:@"%@ F", self.fahrenheitField.text];
        self.isFahrenheitField = TRUE;
    }else if(textField.tag  == CELSIUS_TAG){
#if DEBUG_TC
        NSLog(@"Celsius Field");
#endif
        //pretty format the input
        self.celsiusField.text = [NSString stringWithFormat:@"%@ C", self.celsiusField.text];
        self.isFahrenheitField = FALSE;
    }
    
    return YES;
}



#pragma mark - Private methods


- (void) updateValues {
    
    [self.view endEditing:YES];
    if (self.isFahrenheitField == FALSE){
        float celsius = [self.celsiusField.text floatValue];
        float tempInFahrenheit = celsius*9/5 + 32 ;
        self.fahrenheitField.text = [NSString stringWithFormat:@"%0.2f F", tempInFahrenheit];
    }else if(self.isFahrenheitField == TRUE){
        float fahrenheit = [self.fahrenheitField.text floatValue];
        float tempInCelsius = (fahrenheit-32)*5/9 ;
        self.celsiusField.text = [NSString stringWithFormat:@"%0.2f C", tempInCelsius];
        
    }
    
}

@end
