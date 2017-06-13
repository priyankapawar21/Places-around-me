//
//  TableViewCell.h
//  new-place-find
//
//  Created by Mac on 03/03/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *opning;
@property (weak, nonatomic) IBOutlet UIImageView *lblimgview;

@end
