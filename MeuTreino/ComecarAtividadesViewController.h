//
//  ComecarAtividadesViewController.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 07/05/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AtividadeDiaService.h"
@interface ComecarAtividadesViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    
}
@property (nonatomic, strong) AtividadeDiaService *atividadeDiaService;
@property (nonatomic, strong) NSMutableArray *listaAtividadesDia;
@property (unsafe_unretained) id delegate;
@end
