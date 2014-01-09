//
//  AtividadeDia.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 06/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AtividadeDia : NSObject

@property (nonatomic) NSInteger key;
@property (nonatomic) int idDiaTreino;
@property (nonatomic) BOOL feito;
@property (nonatomic) int idAtividade;
@property (nonatomic, strong) NSString *atividade;
@property (nonatomic, strong) NSString *detalheAtividade;
@property (nonatomic, strong) NSString *observacao;
@property (nonatomic, strong) NSString *quantidade;


@end
