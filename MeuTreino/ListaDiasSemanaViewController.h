//
//  DiasSemanaViewController.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 29/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Atividade.h"
@interface ListaDiasSemanaViewController : UITableViewController

@property (nonatomic) NSInteger idPlanilha;
@property (nonatomic) NSInteger idSemana;
@property (nonatomic) NSInteger semana;
@property (nonatomic) BOOL podeEditar;
@property (unsafe_unretained) id delegate;


-(void)reloadData;

@end
