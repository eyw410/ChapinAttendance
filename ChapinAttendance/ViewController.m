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

@end

@implementation ViewController
- (IBAction)username:(UITextField *)sender {
   // static NSString *usernameValue = self.username.textField;
   // NSLog(@"%@", usernameValue);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //reference to Firebase
    self.fb = [[Firebase alloc] initWithUrl:@"https://chapinattendance.firebaseio.com"];
    Firebase *newChat = [self.fb childByAppendingPath:@"lucy"];
    
    [newChat setValue:@"no"];
    
    // Do any additional setup after loading the view, typically from a nib.


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
