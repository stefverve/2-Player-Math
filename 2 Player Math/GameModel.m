//
//  GameModel.m
//  2 Player Math
//
//  Created by Stefan Verveniotis on 2016-11-07.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "GameModel.h"
#import "ViewController.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [NSArray arrayWithObjects:[Player new], [Player new], nil];
        _inputChars = [NSMutableString stringWithFormat:@""];
        _isPlayer2 = NO;
        _question = [NSString new];
        _answer = 0;
        _gameOn = YES;
        [self generateQuestion];
    }
    return self;
}

- (void) numberButtonPress:(NSString *)input {
    [self.inputChars appendString:input];
    NSLog(@"%@", self.inputChars);
}

- (void) enterButtonPress {
    if ([self.inputChars intValue] == self.answer) {
        [self.players[self.isPlayer2] incrementScore];
    } else {
        [self.players[self.isPlayer2] decrementLives];
    }
    self.inputChars = [NSMutableString stringWithFormat:@""];
    [self generateQuestion];
}

- (void) generateQuestion {
    int num1 = arc4random_uniform(20) + 1;
    int num2 = arc4random_uniform(20) + 1;
    self.question = [NSString stringWithFormat:@"Player %d: %d + %d!", self.isPlayer2 + 1, num1, num2];
    self.answer = num1 + num2;
}

- (int) scoreToUpdate {
    return [self.players[self.isPlayer2] score];
}

- (int) livesToUpdate {
    return [self.players[self.isPlayer2] lives];
}

- (void) nextPlayer {
    self.isPlayer2 = !self.isPlayer2;
}

@end
