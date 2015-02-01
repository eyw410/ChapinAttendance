//
//  StudentViewController.m
//  ChapinAttendance
//
//  Created by Lucy Berman on 2/1/15.
//  Copyright (c) 2015 Developer. All rights reserved.
//

#import "StudentViewController.h"

@interface StudentViewController ()

@property NSString *latitude;
@property NSString *longitude;
@property CLLocationManager *locationManager;

@end


@implementation StudentViewController


- (IBAction)CheckIn:(id)sender {
    NSLog(@"%@", _latitude);
    NSLog(@"%@", _longitude);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"is this working");
    _locationManager = [[CLLocationManager alloc]init]; // initializing locationManager
    _locationManager.delegate = self; // we set the delegate of locationManager to self.
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest; // setting the accuracy
    [_locationManager requestAlwaysAuthorization];
    [_locationManager startUpdatingLocation];  //requesting location updates
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"There was an error retrieving your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [errorAlert show];
    NSLog(@"Error: %@",error.description);
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *crnLoc = [locations lastObject];
    _latitude = [NSString stringWithFormat:@"%.8f",crnLoc.coordinate.latitude];
    
    _longitude = [NSString stringWithFormat:@"%.8f",crnLoc.coordinate.longitude];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
