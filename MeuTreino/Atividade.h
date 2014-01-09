//
//  Atividade.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 01/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Atividade : NSObject

@property (nonatomic) NSInteger key;
@property (nonatomic) NSInteger diaSemana;
@property (nonatomic) NSInteger idSemana;
@property (nonatomic, strong) NSString* atividade;
@property (nonatomic, strong) NSString* detalheAtividade;
@property (nonatomic, strong) NSString* quantidade;
@property (nonatomic, strong) NSString* observacao;


@end
