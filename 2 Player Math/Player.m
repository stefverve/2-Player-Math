//
//  Player.m
//  2 Player Math
//
//  Created by Stefan Verveniotis on 2016-11-07.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lives = 3;
        _score = 0;
    }
    return self;
}

- (void) incrementScore {
    self.score++;
}

- (void) decrementLives {
    self.lives--;
}
@end
