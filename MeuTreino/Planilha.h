//
//  Treino.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 28/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Planilha : NSObject

@property (nonatomic) NSInteger key;
@property (strong, nonatomic) NSString* objetivo;
@property (nonatomic) BOOL podeEditar;

@end
