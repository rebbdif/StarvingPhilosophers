//
//  Fork.h
//  starvingPhilophers
//
//  Created by iOS-School-1 on 13.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLVFork : NSObject

@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign, getter=isFree) BOOL free;

+ (instancetype)forkWithName:(NSString *)name priority:(NSInteger)priority;
- (instancetype)initWithName:(NSString *)name priority:(NSInteger)priority;

- (void)useFork;
- (void)freeFork;

@end
