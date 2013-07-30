//
//  TempViewController.h
//  TemperatureConverter
//
//  Created by Seema Kamath on 7/24/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\seemakam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempViewController : UIViewController <UITextFieldDelegate>



@property (nonatomic, weak) IBOutlet UITextField *fahrenheitField;
@property (nonatomic, weak) IBOutlet UITextField  *celsiusField;
@property (nonatomic, weak) IBOutlet UIButton *convertButton;

@end
