//
//  Looper.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 20/05/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface PlayerMultiFiles : NSObject <AVAudioPlayerDelegate> {
    AVAudioPlayer* player;
    NSArray* fileNameQueue;
    int index;
}

@property (nonatomic, retain) AVAudioPlayer* player;
@property (nonatomic, retain) NSArray* fileNameQueue;

- (id)initWithFileNameQueue:(NSArray*)queue;
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag;
- (void)play:(int)i;
- (void)stop;


@end
