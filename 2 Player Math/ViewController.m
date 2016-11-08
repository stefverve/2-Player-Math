//
//  ViewController.m
//  2 Player Math
//
//  Created by Stefan Verveniotis on 2016-11-07.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic) IBOutlet UIButton *b4;
@property (weak, nonatomic) IBOutlet UIButton *b5;
@property (weak, nonatomic) IBOutlet UIButton *b6;
@property (weak, nonatomic) IBOutlet UIButton *b7;
@property (weak, nonatomic) IBOutlet UIButton *b8;
@property (weak, nonatomic) IBOutlet UIButton *b9;
@property (weak, nonatomic) IBOutlet UIButton *b0;
 

@property (weak, nonatomic) IBOutlet UIButton *bEnter;

@property (weak, nonatomic) IBOutlet UILabel *question;

@property (weak, nonatomic) IBOutlet UILabel *p1Score;
@property (weak, nonatomic) IBOutlet UILabel *p2Score;

@property (weak, nonatomic) IBOutlet UIImageView *p1H1;
@property (weak, nonatomic) IBOutlet UIImageView *p1H2;
@property (weak, nonatomic) IBOutlet UIImageView *p1H3;
@property (weak, nonatomic) IBOutlet UIImageView *p2H3;
@property (weak, nonatomic) IBOutlet UIImageView *p2H2;
@property (weak, nonatomic) IBOutlet UIImageView *p2H1;

@property GameModel *gM;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gM = [GameModel new];
    [self.question setText:self.gM.question];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberButton:(UIButton *)sender {
    NSString *inputAsString = [NSString stringWithFormat:@"%ld", (long)sender.tag];
    [self.gM numberButtonPress:inputAsString];
}

- (IBAction)enterButton:(UIButton *)sender {
    [self.gM enterButtonPress];
    [self updateView];
}

- (void) updateView {
    int scoreToUpdate = [self.gM scoreToUpdate];
    int livesToUpdate = [self.gM livesToUpdate];
    if (self.gM.isPlayer2) {
        [self.p2Score setText:[NSString stringWithFormat:@"Player 2: %d", scoreToUpdate]];
        switch (livesToUpdate) {
            case 0:
                [self.p1H1 setAlpha:0.2];
                [self.p1H2 setAlpha:0.2];
                [self.p1H3 setAlpha:0.2];
                return;
            case 1:
                [self.p2H2 setAlpha:0.2];
                [self.p2H3 setAlpha:0.2];
                break;
            case 2:
                [self.p2H3 setAlpha:0.2];
                break;
        }
    } else {
        [self.p1Score setText:[NSString stringWithFormat:@"Player 1: %d", scoreToUpdate]];
        switch (livesToUpdate) {
            case 0:
                [self.p1H1 setAlpha:0.2];
                [self.p1H2 setAlpha:0.2];
                [self.p1H3 setAlpha:0.2];
                return;
            case 1:
                [self.p1H2 setAlpha:0.2];
                [self.p1H3 setAlpha:0.2];
                break;
            case 2:
                [self.p1H3 setAlpha:0.2];
                break;
        }
    }
    [self.gM nextPlayer];
    [self.question setText:self.gM.question];
}



@end
