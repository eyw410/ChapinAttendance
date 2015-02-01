//
//  StudentViewController.m
//  ChapinAttendance
//
//  Created by Lucy Berman on 2/1/15.
//  Copyright (c) 2015 Developer. All rights reserved.
//

#import "StudentViewController.h"

@interface StudentViewController ()

@property double latitude;
@property double longitude;
@property CLLocationManager *locationManager;

@end


@implementation StudentViewController


- (IBAction)CheckIn:(id)sender {
    static double schoolLat = 40.759211;
    static double schoolLong = -73.984638;
    
    CLLocation *trinityLocation = [[CLLocation alloc] initWithLatitude:schoolLat longitude:schoolLong];
    CLLocation *myLocation = [[CLLocation alloc] initWithLatitude:_latitude longitude:_longitude];
    CLLocationDistance distance = [trinityLocation distanceFromLocation:myLocation];
    NSLog(@"%@", distance);
    
    NSLog(@"%f, %f", _latitude, _longitude);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"screenie.png"]]];

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
    _latitude = crnLoc.coordinate.latitude;
    _longitude = crnLoc.coordinate.longitude;
    
    
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
