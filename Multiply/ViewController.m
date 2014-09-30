//
//  ViewController.m
//  Multiply
//
//  Created by MIKE LAND on 9/29/14.
//  Copyright (c) 2014 MIKE LAND. All rights reserved.
//

#import "ViewController.h"
#import <CheckMate/CheckMate.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}
- (IBAction)onCalculateButtonPressed:(UIButton *)button {
    [self.numberTextField resignFirstResponder];

    NSString *tipAmount = self.numberTextField.text;
    int tipActual = tipAmount.intValue;

    NSString *multiplier = self.multiplierLabel.text;
    int multiplierActual = multiplier.intValue;

    int endValue = 0;

    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {

        endValue = tipActual * multiplierActual;

    } else {

        endValue = tipActual / multiplierActual;

    }

    NSString *answerLabel = [NSString stringWithFormat:@"%i", endValue];

    if (endValue >= 20) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }


    if (endValue % 3 == 0 && endValue % 5 == 0) {
        self.answerLabel.text = @"fizzbuzz";
    } else if (endValue % 3 == 0) {
        self.answerLabel.text = @"fizz";
    } else if (endValue % 5 == 0) {
        self.answerLabel.text = @"buzz";
    } else {
        self.answerLabel.text = answerLabel;
    }

}

- (IBAction)actionSlider:(UISlider *)slider {

    NSString *newSlider = [NSString stringWithFormat:@"%i", ((int)floorf(self.tipSlider.value))];

    self.multiplierLabel.text = newSlider;

}


@end
