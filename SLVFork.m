//
//  Fork.m
//  starvingPhilophers
//
//  Created by iOS-School-1 on 13.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "SLVFork.h"

@interface SLVFork()

@property (nonatomic, strong) NSLock *lock;

@end

@implementation SLVFork

+ (instancetype)forkWithName:(NSString *)name priority:(NSInteger)priority {
    SLVFork *fork = [[SLVFork alloc] initWithName:name priority:priority];
    fork.name = name;
    return fork;
}

- (instancetype)initWithName:(NSString *)name priority:(NSInteger)priority {
    self = [super init];
    if (self) {
        _lock = [NSLock new];
        _free = YES;
        _name = name;
        _priority = priority;
    }
    return self;
}

- (void)useFork {
    [self.lock lock];
    self.free = NO;
}

- (void)freeFork {
    self.free = YES;
    [self.lock unlock];
}

@end
