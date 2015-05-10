//
//  ViewController.m
//  DriveSafeiOS
//
//  Created by Xu Qian Li on 2015-05-09.
//  Copyright (c) 2015 DreamGeese. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

uint8_t mode = POINTER_MODE;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.HIDServ = [OpenSpatialBluetooth sharedBluetoothServ];
    self.HIDServ.delegate = self;
    [super viewDidLoad];
    // instantiate a music player
    MPMusicPlayerController *myPlayer =
    [MPMusicPlayerController applicationMusicPlayer];
    
    // assign a playback queue containing all media items on the device
    [myPlayer setQueueWithQuery: [MPMediaQuery songsQuery]];
    
    // start playing from the beginning of the queue
    [myPlayer play];
}



- (void)setQueueWithQuery:(MPMediaQuery *)query {
    
}


-(void) startLoop
{
    if(mode == POINTER_MODE)
    {
        mode = THREE_D_MODE;
    }
    else
    {
        mode = POINTER_MODE;
    }
    [self performSelector:@selector(startLoop) withObject:nil afterDelay:5];
}

-(void)buttonEventFired: (ButtonEvent *) buttonEvent
{
    NSLog(@"This is the value of button event type from %@", [buttonEvent.peripheral name]);
    switch([buttonEvent getButtonEventType])
    {
        case TOUCH0_DOWN:
        NSLog(@"Touch 0 Down");
        break;
        case TOUCH0_UP:
        NSLog(@"Touch 0 Up");
        break;
        case TOUCH1_DOWN:
        NSLog(@"Touch 1 Down");
        break;
        case TOUCH1_UP:
        NSLog(@"Touch 1 Up");
        break;
        case TOUCH2_DOWN:
        NSLog(@"Touch 2 Down");
        break;
        case TOUCH2_UP:
        NSLog(@"Touch 2 Up");
        break;
        case TACTILE0_DOWN:
        NSLog(@"Tactile 0 Down");
        break;
        case TACTILE0_UP:
        NSLog(@"Tactile 0 Up");
        break;
        case TACTILE1_DOWN:
        NSLog(@"Tactile 1 Down");
        break;
        case TACTILE1_UP:
        NSLog(@"Tactile 1 Up");
        break;
    }
}

-(void)pointerEventFired: (PointerEvent *) pointerEvent
{
    
    NSLog(@"This is the x value of the pointer event from %@", [pointerEvent.peripheral name]);
    NSLog(@"%hd", [pointerEvent getXValue]);
    
    
    NSLog(@"This is the y value of the pointer event from %@", [pointerEvent.peripheral name]);
    NSLog(@"%hd", [pointerEvent getYValue]);
}

-(void) gestureEventFired: (GestureEvent *) gestureEvent
{
    NSLog(@"This is the value of gesture event type from %@", [gestureEvent.peripheral name]);
    switch([gestureEvent getGestureEventType])
    {
        case SWIPE_UP:
        NSLog(@"Gesture Up");
        break;
        case SWIPE_DOWN:
        NSLog(@"Gesture Down");
        break;
        case SWIPE_LEFT:
        NSLog(@"Gesture Left");
        break;
        case SWIPE_RIGHT:
        NSLog(@"Gesture Right");
        break;
        case SLIDER_LEFT:
        NSLog(@"Slider Left");
        break;
        case SLIDER_RIGHT:
        NSLog(@"Slider Right");
        break;
        case CCW:
        NSLog(@"Counter Clockwise");
        break;
        case CW:
        NSLog(@"Clockwise");
        break;
    }
}

-(void) rotationEventFired:(RotationEvent *)rotationEvent
{
    NSLog(@"This is the x value of the quaternion from %@", [rotationEvent.peripheral name]);
    NSLog(@"%f", rotationEvent.x);
    
    NSLog(@"This is the y value of the quaternion from %@", [rotationEvent.peripheral name]);
    NSLog(@"%f", rotationEvent.y);
    
    NSLog(@"This is the z value of the quaternion from %@", [rotationEvent.peripheral name]);
    NSLog(@"%f", rotationEvent.z);
    
    NSLog(@"This is the roll value of the quaternion from %@", [rotationEvent.peripheral name]);
    NSLog(@"%f", rotationEvent.roll);
    
    NSLog(@"This is the pitch value of the quaternion from %@", [rotationEvent.peripheral name]);
    NSLog(@"%f", rotationEvent.pitch);
    
    NSLog(@"This is the yaw value of the quaternion from %@", [rotationEvent.peripheral name]);
    NSLog(@"%f", rotationEvent.yaw);
}

- (void) didConnectToNod: (CBPeripheral*) peripheral
{
    NSLog(@"connected %@",peripheral);
    
}

/*
 *  FUNCTIONS TO SUBSCRIBE TO EVENTS... COMMENT OUT UNWANTED EVENTS
 */

- (IBAction)start:(UIButton *)sender
{
    for(NSString* name in [self.HIDServ.connectedPeripherals allKeys])
    {
        //        [self.HIDServ subscribeToPointerEvents:name];
        //        [self.HIDServ subscribeToButtonEvents:name];
        [self.HIDServ subscribeToGestureEvents:name];
        //        [self.HIDServ subscribeToRotationEvents:name];
        //        [self.HIDServ subscribeToMotion6DEvents:name];
    }
}
- (IBAction)quit:(id)sender
{
    for(NSString* name in [self.HIDServ.connectedPeripherals allKeys])
    {
        [self.HIDServ unsubscribeFromPointerEvents:name];
        [self.HIDServ unsubscribeFromButtonEvents:name];
        [self.HIDServ unsubscribeFromGestureEvents:name];
        [self.HIDServ unsubscribeFromRotationEvents:name];
        [self.HIDServ unsubscribeFromMotion6DEvents:name];
    }
    
}

-(void) motion6DEventFired:(Motion6DEvent *)motion6DEvent
{
    NSLog(@"Motion 6D Event Fired:: xAccel:%f, yAccel:%f, zAccel:%f, xGyro: %f, yGyro:%f, zGyro:%f",
          motion6DEvent.xAccel, motion6DEvent.yAccel, motion6DEvent.zAccel,
          motion6DEvent.xGyro, motion6DEvent.yGryo, motion6DEvent.zGryo);
}

@end