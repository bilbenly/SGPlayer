//
//  SGFFFrameFactory.m
//  SGPlayer
//
//  Created by Single on 2018/1/21.
//  Copyright © 2018年 single. All rights reserved.
//

#import "SGFFFrameFactory.h"


@implementation SGFFAudioFrame (Factory)

- (SGFFAudioFrame *)initWithAVFrame:(AVFrame *)frame timebase:(SGFFTimebase)timebase;
{
    if (self = [super init])
    {
        self.timebase = timebase;
        self.format = frame->format;
        self.numberOfSamples = frame->nb_samples;
        self.sampleRate = av_frame_get_sample_rate(frame);
        self.numberOfChannels = av_frame_get_channels(frame);
        self.channelLayout = av_frame_get_channel_layout(frame);
        self.position = av_frame_get_best_effort_timestamp(frame);
        self.duration = av_frame_get_pkt_duration(frame);
        self.size = av_frame_get_pkt_size(frame);
        self.bestEffortTimestamp = av_frame_get_best_effort_timestamp(frame);
        self.packetPosition = av_frame_get_pkt_pos(frame);
        self.packetDuration = av_frame_get_pkt_duration(frame);
        self.packetSize = av_frame_get_pkt_size(frame);
        self.data = frame->data;
    }
    return self;
}

@end