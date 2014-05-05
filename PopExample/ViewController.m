//
//  ViewController.m
//  PopExample
//
//  Created by Louis Chang on 2014/5/4.
//  Copyright (c) 2014年 PromptApps. All rights reserved.
//

#import "ViewController.h"
#import <POP.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)textFieldDidEditingChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDidEditingChanged:(id)sender {
    NSLog(@"%@", self.textField.text);
    POPSpringAnimation *buttonAnimation = [POPSpringAnimation animation];
    buttonAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerSize];
    
    CGSize textSize = [self.textField.text sizeWithAttributes:@{NSFontAttributeName:self.textField.font}];
    
    buttonAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(20+textSize.width, textSize.height)];
    buttonAnimation.springBounciness = 20.0;
    buttonAnimation.springSpeed = 10.0;
    [self.textField pop_addAnimation:buttonAnimation forKey:@"pop"];
    
}
@end
