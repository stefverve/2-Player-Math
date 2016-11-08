//
//  GameModel.h
//  2 Player Math
//
//  Created by Stefan Verveniotis on 2016-11-07.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
@class ViewController;


@interface GameModel : NSObject

@property NSArray *players;
@property BOOL isPlayer2;
@property NSMutableString *inputChars;
@property NSString *question;
@property int answer;
@property BOOL gameOn;


- (void) numberButtonPress:(NSString *)input;
- (void) enterButtonPress;
- (void) generateQuestion;
- (int) scoreToUpdate;
- (int) livesToUpdate;
- (void) nextPlayer;

@end
