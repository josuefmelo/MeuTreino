//
//  Atleta.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 02/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Atleta : NSObject
@property (nonatomic) int key;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* dataNascimento;
@property (nonatomic) double peso;
@property (nonatomic) double altura;

@end
