//
//  Treino.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 04/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Treino : NSObject

@property (nonatomic) NSInteger key;
@property (nonatomic, strong) NSString* planilha;
@property (nonatomic) int idPlanilha;
@property (nonatomic) long dataInicio;
@property (nonatomic) long dataFim;
@end
