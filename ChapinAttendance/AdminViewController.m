//
//  AdminViewController.m
//  ChapinAttendance
//
//  Created by Lucy Berman on 2/1/15.
//  Copyright (c) 2015 Developer. All rights reserved.
//

#import "AdminViewController.h"

@interface AdminViewController ()

@property NSMutableArray *innerArray;
@property NSMutableArray *dataArray;

@end

@implementation AdminViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.innerArray = [NSMutableArray arrayWithObjects: @"Lucy", @"Elizabeth", @"Laura", nil];
    
    for (NSString* thing in self.innerArray)
    {
        
        NSLog(@"%@", thing);
    }

    self.dataArray = [NSMutableArray arrayWithObjects: @"Lucy", @"Elizabeth", @"Laura", nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    return [self.dataArray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set the data for this cell:
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
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
