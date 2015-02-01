//
//  StudentViewController.m
//  ChapinAttendance
//
//  Created by Lucy Berman on 2/1/15.
//  Copyright (c) 2015 Developer. All rights reserved.
//

#import "StudentViewController.h"
#import <Firebase/Firebase.h>

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
    NSLog(@"%f", distance);
    if (distance == 0){
        [self updateFirebase];
        NSLog(@"distance is 0");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Check-In Complete" message:@"Thank you for checking in." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        
        [alert addButtonWithTitle:@"Yes"];
        [alert show];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGSize backgroundSize = CGSizeMake(width, height);
    UIImage *background = [self imageWithImage: [UIImage imageNamed: @"FINAL.jpg"] scaledToSize:backgroundSize];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:background]];

    NSLog(@"is this working");
    _locationManager = [[CLLocationManager alloc]init]; // initializing locationManager
    _locationManager.delegate = self; // we set the delegate of locationManager to self.
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest; // setting the accuracy
    [_locationManager requestAlwaysAuthorization];
    [_locationManager startUpdatingLocation];  //requesting location updates
    
}

-(void)updateFirebase {
    
}

-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
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
