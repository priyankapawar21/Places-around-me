//
//  TableViewController.h
//  new-place-find
//
//  Created by Mac on 03/03/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "detail.h"
@interface TableViewController : UITableViewController
//@property (nonatomic,retain)detail *d;
@property (nonatomic,retain)NSMutableArray *result;
//@property(nonatomic,retain)detail *d;
@property(nonatomic,retain)UIRefreshControl *refresh;
@property(nonatomic,retain)NSString*imgname;
@end
