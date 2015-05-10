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

@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property OpenSpatialBluetooth *HIDServ;
@property CBPeripheral *lastNodPeripheral;
@property NSString *gesture;
@property float *volumeControl;
@property (nonatomic, retain) MPMusicPlayerController *musicPlayer;
- (IBAction) changeButtonPressed:(id)sender;
-(void) startLoop;



@end

