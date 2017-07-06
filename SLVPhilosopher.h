//
//  Philosopher.h
//  starvingPhilophers
//
//  Created by iOS-School-1 on 13.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SLVFork;

@interface SLVPhilosopher : NSThread

@property (nonatomic, strong) SLVFork *leftFork;
@property (nonatomic, strong) SLVFork *rightFork;
@property (nonatomic, assign, getter=isSatisfied) BOOL satisfied;

+ (instancetype)philosopher;

@end
