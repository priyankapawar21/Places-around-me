//
//  CollectionViewController.m
//  new-place-find
//
//  Created by Mac on 03/03/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "TableViewController.h"
#import "notDataViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    _queue=[[NSOperationQueue alloc]init];
    _D=[[detail alloc]init];
    _temparr=[[NSMutableArray alloc]init];
    
    _images=[[NSMutableArray alloc]initWithObjects:@"rest.jpeg",@"hospimg.jpeg",@"atmimg.jpeg",@"bloodimg.jpeg", nil];
    _customcell=[[CollectionViewCell alloc]init];
    
    _manager=[[CLLocationManager alloc]init];
    _manager.desiredAccuracy=kCLLocationAccuracyBest;
    _manager.delegate=self;
    [_manager startUpdatingLocation];
    
    _geocoder=[[CLGeocoder alloc]init];
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return 4;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
   
    
    cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:[_images objectAtIndex:indexPath.row]]];
    return cell;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *currentadd=[locations lastObject];
    [_geocoder reverseGeocodeLocation:currentadd completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *place=[placemarks objectAtIndex:0];
        _add=[[NSString alloc]initWithString:place.locality];
        NSLog(@"add%@",_add);
    }];
}




-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        //_add=@"mumbai";
        NSString *newadd = [_add stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSLog(@"^^^^^^^^^^^^%@",newadd);
        _s=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+%@&key=AIzaSyCRgMpNhfmCSPK6oV18pyMPNuNs1tmalyc",newadd];
      //  _imgnm=@"restinimg.jpeg";
        [_temparr removeAllObjects];
        NSLog(@"in block");
    }
    if(indexPath.row==1)
    {
        NSString *newadd = [_add stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSLog(@"^^^^^^^^^^^^%@",newadd);
        //_add=@"mumbai";
        _s=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=hospitals+in+%@&key=AIzaSyCRgMpNhfmCSPK6oV18pyMPNuNs1tmalyc",newadd];
         _imgnm=@"hospinimg.jpg";
         
        [_temparr removeAllObjects];
        NSLog(@"in hosp block");
    }
    if(indexPath.row==2)
    {
        //_add=@"mumbai";
        NSString *newadd = [_add stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSLog(@"^^^^^^^^^^^^%@",newadd);
        _s=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=ATM+in+%@&key=AIzaSyCRgMpNhfmCSPK6oV18pyMPNuNs1tmalyc",newadd];
        [_temparr removeAllObjects];
        NSLog(@"in hosp block");
    }
    if(indexPath.row==3)
    {
        NSString *newadd = [_add stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSLog(@"^^^^^^^^^^^^%@",newadd);
        //_add=@"mumbai";
        _s=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/textsearch/json?query=bloodbank+in+%@&key=AIzaSyCRgMpNhfmCSPK6oV18pyMPNuNs1tmalyc",newadd];
        [_temparr removeAllObjects];
        NSLog(@"in block");
        
        
    }
    NSBlockOperation *op1=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"in block");
        NSURL *url=[NSURL URLWithString:_s];
        NSData *data=[NSData dataWithContentsOfURL:url];
        
                    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSArray *arr=[dict objectForKey:@"results"];
            for(NSDictionary *temp in arr)
            {
                    detail *D1=[[detail alloc]init];
                D1.objaddress=[temp objectForKey:@"formatted_address"];
           
            //NSDictionary *namedict=[temp objectForKey:@"geometry"];
                if(D1.objaddress==nil)
                {
                    D1.objaddress=@"not provided";
                }
                D1.objname=[temp objectForKey:@"name"];
                NSLog(@" --------%@",D1.objname);
                D1.objrating=[temp objectForKey:@"rating"];
                
                if(D1.objrating ==nil)
                {
               
                    D1.objrating=@"not provided";
                }
                NSDictionary *opendict=[temp objectForKey:@"opening_hours"];
                D1.objopen=[opendict objectForKey:@"open_now"];
               
                if(D1.objopen ==nil)
                {
                    D1.objopen=@"not provided";
                }
                [_temparr addObject:D1];
    
            
         
            }
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
          
            UIStoryboard *s=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            TableViewController *tvc=[s instantiateViewControllerWithIdentifier:@"second"];
            tvc.result=_temparr;
            tvc.imgname=_imgnm;
            [self.navigationController pushViewController:tvc animated:YES];
        
           
        }];
    }];
    [_queue addOperation:op1];
    
    
     
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
