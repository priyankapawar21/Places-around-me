//
//  CollectionViewController.h
//  new-place-find
//
//  Created by Mac on 03/03/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CollectionViewCell.h"
#import "detail.h"
#import "TableViewController.h"
@interface CollectionViewController : UICollectionViewController<CLLocationManagerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,retain)CollectionViewCell *customcell;
@property(nonatomic,retain)NSOperationQueue *queue;
@property(nonatomic,retain)NSString *add,*s,*imgnm;
@property(nonatomic,retain)CLLocationManager *manager;
@property(nonatomic,retain)CLGeocoder *geocoder;
@property(nonatomic,retain)detail *D;
@property(nonatomic,retain)NSMutableArray *temparr,*images;
@property(nonatomic,retain)TableViewController *table;
@property int flag;
@end
