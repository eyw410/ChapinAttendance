//
//  ViewController.m
//  ChapinAttendance
//
//  Created by Developer on 2/1/15.
//  Copyright (c) 2015 Developer. All rights reserved.
//

#import "ViewController.h"
#import <Firebase/Firebase.h>

@interface ViewController ()

@property Firebase *fb;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;

@end

@implementation ViewController
- (IBAction)username:(UITextField *)sender {
   // static NSString *usernameValue = self.username.textField;
   // NSLog(@"%@", usernameValue);
}

- (IBAction)login:(id)sender {
    Firebase *newUser = [self.fb childByAppendingPath:self.userTextField.text];
    [newUser setValue:@"present"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //reference to Firebase
    self.fb = [[Firebase alloc] initWithUrl:@"https://chapinattendance.firebaseio.com"];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGSize backgroundSize = CGSizeMake(width, height);
    UIImage *background = [self imageWithImage: [UIImage imageNamed: @"4.jpg"] scaledToSize:backgroundSize];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:background]];
    
    // Do any additional setup after loading the view, typically from a nib.

}

-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/*-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"dkfjs");
    return YES;
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
