//
//  Looper.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 20/05/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "PlayerMultiFiles.h"

@implementation PlayerMultiFiles
@synthesize player, fileNameQueue;

- (id)initWithFileNameQueue:(NSArray*)queue {
    if ((self = [super init])) {
        self.fileNameQueue = queue;
        index = 0;
        [self play:index];
    }
    return self;
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    if (index < fileNameQueue.count) {
        [self play:index];
    } else {
        //reached end of queue
    }
}

- (void)play:(int)i {
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:[fileNameQueue objectAtIndex:i] ofType:@"m4a"]] error:nil];
    player.delegate = self;
    [player setVolume:1.0];
    [player prepareToPlay];
    [player play];
    index++;
}

- (void)stop {
    if (self.player.playing) [player stop];
}

- (void)dealloc {
    self.fileNameQueue = nil;
    self.player = nil;
}

@end