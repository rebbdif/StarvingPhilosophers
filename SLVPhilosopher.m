//
//  Philosopher.m
//  starvingPhilophers
//
//  Created by iOS-School-1 on 13.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "SLVPhilosopher.h"
#import "SLVFork.h"

@implementation SLVPhilosopher

+ (SLVPhilosopher *)philosopher {
    SLVPhilosopher *philosopher = [SLVPhilosopher new];
    philosopher.satisfied = NO;
    return philosopher;
}

- (void)main {
    NSLog(@"ph %@ started", self.name);
    
    BOOL eatWithLocks = NO;
    if (eatWithLocks) {
        [self eatWithLocks];
    } else {
        [self eatWithPriorities];
    }
}

- (void)eatWithLocks {
    [self.leftFork useFork];
    [self.rightFork useFork];
    NSLog(@"%@ is eating", self.name);
    sleep(1);
    [self.leftFork freeFork];
    [self.rightFork freeFork];
    NSLog(@"%@ done", self.name);
}

- (void)eatWithPriorities {
    if (self.leftFork.priority < self.rightFork.priority) {
        while (!self.leftFork.isFree) continue;
        self.leftFork.free = NO;
        while (!self.rightFork.isFree) continue;
        self.rightFork.free = NO;
    } else {
        while (!self.rightFork.isFree) continue;
        self.rightFork.free = NO;
        while (!self.leftFork.isFree) continue;
        self.leftFork.free = NO;
    }
    NSLog(@"%@ is eating", self.name);
    self.leftFork.free = YES;
    self.rightFork.free = YES;
    NSLog(@"%@ done", self.name);
}


@end
