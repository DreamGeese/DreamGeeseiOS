//
//  ViewController.h
//  RingScanTableViewController
//
//  Created by Xu Qian Li on 2015-05-09.
//  Copyright (c) 2015 DreamGeese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenSpatialBluetooth.h"
#import "ViewController.h"


@interface RingScanTableViewController : UITableViewController <OpenSpatialBluetoothDelegate>


@property NSMutableArray* rings;

@end