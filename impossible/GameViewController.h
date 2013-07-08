//
//  GameViewController.h
//  Impossible
//
//  View Controller responsável pelo controle do jogo
//  Aqui configuramos as opções como touch e view.
//

#import <UIKit/UIKit.h>
#import "Impossible.h"

@interface GameViewController : UIViewController

@property (nonatomic, strong) Impossible *impossibleView;

@end
