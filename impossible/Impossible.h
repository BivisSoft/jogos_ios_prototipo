//
//  Impossible.h
//  Impossible
//
//  Classe responsável por executar o Game Loop e desenhar elementos na tela,
//  assim como detectar colisões.
//

#import <UIKit/UIKit.h>

@interface Impossible : UIView

@property (nonatomic, strong) NSTimer *gameRunTimer;
@property (nonatomic, strong) UILabel *gameOverLabel;
@property (nonatomic, strong) UILabel *gameScoreLabel;

@property (nonatomic) BOOL running;

@property (nonatomic) int score;

@property (nonatomic) int playerX;
@property (nonatomic) int playerY;
@property (nonatomic) int playerRadius;

@property (nonatomic) int enemyX;
@property (nonatomic) int enemyY;
@property (nonatomic) int enemyRadius;

- (void)restart;
- (void)stopGame;
- (void)moveDown:(int)pixels;
- (void)increaseScore:(int)points;

@end
