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
@property(nonatomic, strong) NSArray *headers;
@property(nonatomic, strong) NSMutableArray *colors;
@property(nonatomic, strong) NSMutableArray *filteredColors;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colors = [[NSMutableArray alloc] init];
    [self.colors addObject:[[NSMutableArray alloc] initWithArray:@[@"Red", @"Green", @"Blue"]]];
    [self.colors addObject:[[NSMutableArray alloc] initWithArray:@[@"White", @"Black", @"Grey"]]];
    [self.colors addObject:[[NSMutableArray alloc] initWithArray:@[@"Cyan", @"Magenta", @"Yello", @"Key"]]];
    
    self.headers = @[@"RGB", @"WBG", @"CMYK"];
    
    self.filteredColors = [[NSMutableArray alloc] init];
    
}



#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.tableView == tableView) {
        return self.colors.count;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.tableView == tableView) {
        return [self.colors[section] count];
    } else {
        return self.filteredColors.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSString *text;
    if (self.tableView == tableView) {
        text = self.colors[indexPath.section][indexPath.row];
    } else {
        text = self.filteredColors[indexPath.row];
    }
    
    cell.label1.text = text;
    cell.label2.text = @(text.hash).stringValue;
    return cell;
}

#pragma mark - UITableViewDelegate
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.tableView == tableView) {
        return self.headers[section];
    } else {
        return @"";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

#pragma mark - UISearchDisplayDelegate
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {

    NSLog(@"search string is %@", searchString);
    [self filterContentForSearchString:searchString];
    return YES;
}

#pragma mark - Aux
- (void)filterContentForSearchString:(NSString*)searchString {
    searchString = [searchString lowercaseString];
    NSMutableArray *filteredColors = [[NSMutableArray alloc] init];
    for (NSInteger section = 0; section < self.colors.count; ++section) {
        for (NSInteger row = 0; row < [self.colors[section] count]; ++row) {
            NSString *color = [self.colors[section][row] lowercaseString];
            
            if ([color rangeOfString:searchString].location != NSNotFound) {
                [filteredColors addObject:color];
            }
        }
    }
    self.filteredColors = filteredColors;
}

@end
