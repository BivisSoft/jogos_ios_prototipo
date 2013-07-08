//
//  Impossible.m
//  Impossible
//
//  Classe responsável por executar o Game Loop e desenhar elementos na tela,
//  assim como detectar colisões.
//

#import "Impossible.h"

@implementation Impossible

#pragma mark Inicialização do Objeto

- (id)init
{
    self = [super init];
    if (self) {
        
        // Criação do Label que exibirá a mensagem de "Game Over!"
        self.gameOverLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 40.0f, 300.0f, 50.0f)];
        self.gameOverLabel.font = [UIFont systemFontOfSize:40.0f];
        self.gameOverLabel.textColor = [UIColor lightGrayColor];
        self.gameOverLabel.backgroundColor = [UIColor clearColor];
        self.gameOverLabel.text = @"";
        [self addSubview:self.gameOverLabel];

        // Criação do Label que exibirá o score do jogador
        self.gameScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 85.0f, 300.0f, 30.0f)];
        self.gameScoreLabel.font = [UIFont systemFontOfSize:25.0f];
        self.gameScoreLabel.textColor = [UIColor whiteColor];
        self.gameScoreLabel.backgroundColor = [UIColor clearColor];
        self.gameScoreLabel.text = @"0";
        [self addSubview:self.gameScoreLabel];
        
        // Timer que executa o Game Loop (método "run") 60 vezes por segundo
        self.gameRunTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f/60.0f target:self selector:@selector(run) userInfo:nil repeats:YES];
        
        // Posição inicial do jogador
        self.playerRadius = 25;
        self.playerX = 160;
        self.playerY = 275;
        
        // Variável para controlar a execução do jogo
        self.running = YES;
    }
    return self;
}


#pragma mark Estados do Jogo

// Game Loop
- (void)run
{
    if (self.running == YES) {
        // Aumenta raio do inimigo
        self.enemyRadius++;
        
        // Checa colisões
        [self checkCollision];

        // Informa ao iOS que a tela deve ser redesenhada
        [self setNeedsDisplay];
    }
}

// Para o Jogo
- (void)stopGame
{
    self.running = NO;
}

// Reinicia o jogo, redefinindo as variáveis
- (void)restart
{
	self.enemyX = 0;
    self.enemyY = 0;
    self.enemyRadius = 0;
    
    self.playerRadius = 25;
	self.playerX = 160;
    self.playerY = 275;
    
    self.score = 0;
    self.gameScoreLabel.text = @"0";
    self.gameOverLabel.text = @"";
    
    self.running = YES;
}


#pragma mark Ações do Jogo

// Move o Player
- (void)moveDown:(int)pixels
{
    if (self.running == YES) {
        self.playerY += pixels;
    }
}

// Soma Pontos
- (void)increaseScore:(int)points
{
    if (self.running == YES) {
        self.score += points;
        self.gameScoreLabel.text = [NSString stringWithFormat:@"%d", self.score];
    }
}

// Verifica Colisões
- (void)checkCollision
{
    double distance = 0.0f;
    
    // Teorema de Pitágoras
    distance = pow(self.playerY - self.enemyY, 2) + pow(self.playerX - self.enemyX, 2);
    distance = sqrt(distance);
    
    if (distance <= (self.playerRadius + self.enemyRadius)) {
        self.gameOverLabel.text = @"GAME OVER!";
        self.running = NO;
    }
}


#pragma mark Renderização

// Método da UIView que desenha a tela
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawBackgroundInContext:context];
    [self drawPlayerInContext:context];
    [self drawEnemyInContext:context];
}

// Desenha o Plano de Fundo
- (void)drawBackgroundInContext:(CGContextRef)context
{
//    UIGraphicsPushContext(context);
//    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
//    CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
//    UIGraphicsPopContext();
    
    // Utiliza uma imagem do projeto e a desenha em um determinado ponto da tela
    UIImage *image = [UIImage imageNamed:@"sky.png"];
    [image drawAtPoint:CGPointMake(0.0f, 0.0f)];
}

// Desenha o Player
- (void)drawPlayerInContext:(CGContextRef)context
{
//    UIGraphicsPushContext(context);
//    CGContextBeginPath(context);
//    CGContextAddArc(context, self.playerX, self.playerY, self.playerRadius, 0, (2 * M_PI), YES); // Círculo de 360° (0 ~ 2pi)
//    CGContextSetRGBFillColor(context, 0.0f, 0.9f, 0.0f, 1.0f);
//    CGContextFillPath(context);
//    UIGraphicsPopContext();
    
    // Utiliza uma imagem do projeto e a desenha em um determinado ponto da tela
    UIImage *image = [UIImage imageNamed:@"nave.png"];
    [image drawAtPoint:CGPointMake((self.playerX - (image.size.width / 2)), (self.playerY - (image.size.height / 2)))];
}

// Desenha o Inimigo
- (void)drawEnemyInContext:(CGContextRef)context
{
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, self.enemyX, self.enemyY, self.enemyRadius, 0, (2 * M_PI), YES); // Círculo de 360° (0 ~ 2pi)
    CGContextSetRGBFillColor(context, 1.0f, 0.0f, 0.0f, 1.0f);
    CGContextFillPath(context);
    UIGraphicsPopContext();
}

@end
