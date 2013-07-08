//
//  GameViewController.m
//  Impossible
//
//  View Controller responsável pelo controle do jogo
//  Aqui configuramos as opções como touch e view.
//

#import "GameViewController.h"

@implementation GameViewController

#pragma mark Inicialização da View Controller

- (void)viewDidLoad
{
    [super viewDidLoad];
	    
    // Instancia um objeto do tipo Impossible
    self.impossibleView = [[Impossible alloc] init];

    // Define o tamanho dele, com base no tamanho da tela
    self.impossibleView.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.impossibleView];
    
    // Intancia um objeto para reconhecimento de gestos do tipo "Tap" e a ação a ser executada quando o usuário realizar o gesto
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];

    // Adiciona o reconhecimento de gestos à view com a qual o usuário irá interagir
    [self.impossibleView addGestureRecognizer:tapGesture];
    
    // Botão para Reiniciar o jogo
    UIButton *buttonRestart = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRestart setTitle:@"Restart" forState:UIControlStateNormal];
    buttonRestart.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    buttonRestart.frame = CGRectMake(20.0f, 170.0f, 80.0f, 35.0f);
    [buttonRestart addTarget:self action:@selector(restart:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonRestart];

    // Botão para Parar o jogo
    UIButton *buttonStop = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonStop setTitle:@"Stop" forState:UIControlStateNormal];
    buttonStop.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    buttonStop.frame = CGRectMake(20.0f, 250.0f, 80.0f, 35.0f);
    [buttonStop addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonStop];
}


#pragma mark Ações do Jogador

- (void)restart:(id)sender
{
    [self.impossibleView restart];
}

- (void)stop:(id)sender
{
    [self.impossibleView stopGame];
}

- (void)handleTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self.impossibleView moveDown:10];
        [self.impossibleView increaseScore:100];
    }
}

@end
