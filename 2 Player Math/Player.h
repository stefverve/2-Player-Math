//
//  Player.h
//  2 Player Math
//
//  Created by Stefan Verveniotis on 2016-11-07.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property int lives;
@property int score;

- (void) incrementScore;
- (void) decrementLives;

@end
