//
//  AppDelegate.m
//  starvingPhilosophers
//
//  Created by 1 on 06.07.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "AppDelegate.h"
#import "SLVFork.h"
#import "SLVPhilosopher.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSArray<SLVPhilosopher *> *philosophers;
@property (nonatomic, strong) NSArray<SLVFork *> *forks;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self createForks];
    [self createPhilosophers];
    for (NSUInteger i = 0; i < 5; ++i) {
        SLVPhilosopher *philosopher = self.philosophers[i];
        philosopher.leftFork = self.forks[i];
        if (i < 4) {
            philosopher.rightFork = self.forks[i+1];
        } else {
            philosopher.rightFork = self.forks[0];
        }
    }
    
    for (NSUInteger i = 0; i < 5; ++i) {
        SLVPhilosopher *philosopher = self.philosophers[i];
        [philosopher start];
    }
    
    return YES;
}

- (void)createForks {
    NSMutableArray *forks = [NSMutableArray arrayWithCapacity:5];
    for (NSUInteger i = 0; i < 5; ++i) {
        [forks addObject:[SLVFork new]];
    }
    self.forks = [forks copy];
}

- (void)createPhilosophers {
    NSMutableArray *philosophers = [NSMutableArray arrayWithCapacity:5];
    for (NSUInteger i = 0; i < 5; ++i) {
        SLVPhilosopher *philosopher = [SLVPhilosopher new];
        philosopher.name = [NSString stringWithFormat:@"%ld", i];
        [philosophers addObject:philosopher];
    }
    self.philosophers = [philosophers copy];
}

@end
