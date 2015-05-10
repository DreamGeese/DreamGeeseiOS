//
//  ViewController.h
//  DriveSafeiOS
//
//  Created by Xu Qian Li on 2015-05-09.
//  Copyright (c) 2015 DreamGeese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenSpatialBluetooth.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController <OpenSpatialBluetoothDelegate>

@property OpenSpatialBluetooth *HIDServ;
@property CBPeripheral *lastNodPeripheral;

-(void) startLoop;

@end

