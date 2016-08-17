//
//  ViewController.m
//  RYTableView
//
//  Created by ryuzmukhametov on 17/08/16.
//  Copyright © 2016 Rustam Yuzmukhametov. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.label1.text = [NSString stringWithFormat:@"%ld %ld", indexPath.section, indexPath.row];
    cell.label2.text = @"subtitle";
    return cell;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"title %ld", (long)section];
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
//    [self filterContentForSearchText:searchString
//                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
//                                      objectAtIndex:[self.searchDisplayController.searchBar
//                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

@end
