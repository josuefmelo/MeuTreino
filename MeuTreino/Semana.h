//
//  Semana.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 29/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Atividade.h"

@interface Semana : NSObject

@property (nonatomic) NSInteger key;
@property (nonatomic) NSInteger semana;
@property (nonatomic) NSInteger idPlanilha;


@property (nonatomic, strong) NSMutableArray *listAtividade;


@end
