//
//  CSPlayer.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/25.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSPlayer.h"
#import <AVFoundation/AVFoundation.h>
static CSPlayer *player;
@interface CSPlayer()
@property (nonatomic, strong) AVPlayer *player;
@end
@implementation CSPlayer
+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[super allocWithZone:NULL]init];
    });
    return player;
}
- (void)playWithUrlStr:(NSString *)urlString{
    self.player = [[AVPlayer alloc]initWithURL:[NSURL URLWithString:urlString]];
    [self.player.currentItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self.player play];
}
- (void)play{
    [self.player play];
}
- (void)pause{
    [self.player pause];
}
- (void)stop{
    [self.player pause];
}
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context{
    if([keyPath isEqualToString:@"status"]){
        AVPlayerStatus status = [change[NSKeyValueChangeNewKey]intValue];
        switch (status) {
            case AVPlayerStatusFailed:
            {
                NSLog(@"item 有误");
                break;
            }
            case AVPlayerStatusReadyToPlay:
            {
                NSLog(@"准备好播放了");
                if(self.readyToPlayBlock){
                    self.readyToPlayBlock();
                }
                break;
            }
            case AVPlayerStatusUnknown:
            {
                NSLog(@"资源出现未知错误");
                break;
            }
                
            default:
                break;
        }
    }
}
- (void)removeObserver{
    [self.player.currentItem removeObserver:self forKeyPath:@"status" context:nil];
}
@end
