//
//  ViewController.h
//  RYTableView
//
//  Created by ryuzmukhametov on 17/08/16.
//  Copyright © 2016 Rustam Yuzmukhametov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDisplayController;

@end

