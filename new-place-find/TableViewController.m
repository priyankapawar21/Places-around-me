//
//  TableViewController.m
//  new-place-find
//
//  Created by Mac on 03/03/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "detail.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    
    _refresh=[[UIRefreshControl alloc]init];
   [_refresh addTarget:self action:@selector(refresh1:) forControlEvents:UIControlEventValueChanged];
    //_d=[[detail alloc]init];
    self.tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:_imgname]];
                                     
}


-(void)refresh1:(UIRefreshControl *)sender{
    [self.tableView reloadData];
    [sender endRefreshing];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  300;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _result.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    

    detail *d= [_result objectAtIndex:indexPath.row];
    NSLog(@"+++++++%@",d.objname);
    cell.name.text=[NSString stringWithFormat:@"%@", d.objname];
    cell.address.lineBreakMode=UILineBreakModeWordWrap;
    cell.address.numberOfLines=10;
    cell.address.text=[NSString stringWithFormat:@"%@",d.objaddress];
    cell.rating.text=[NSString stringWithFormat:@"%@",d.objrating];
   // cell.opning.text=[NSString stringWithFormat:@"%@",d.objopen];
    NSLog(@"oooooo%@",d.objaddress);
    if( [d.objopen intValue] == 1)
    {
        cell.opning.textColor=[UIColor greenColor];
        cell.opning.text=@"open now";
        NSLog(@"iiiii%@",d.objopen);
        
    }
    if( [d.objopen intValue] == 0)
    {
        cell.opning.textColor=[UIColor redColor];
        cell.opning.text=@"close now";
        //NSLog(@"iiiii%@",d.objopen);
        
    }
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
