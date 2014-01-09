//
//  AtividadeService.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 01/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Atividade.h"
@interface AtividadeService : NSObject{
    FMDatabase *database;
}
-(void)insert:(Atividade*)at;

- (NSMutableArray*) listBySemana:(NSInteger) idSemana andDiaSemana:(NSInteger) dia;
- (void)removeBySemana:(NSInteger)idSemana;
- (void)remove:(NSInteger) key;
@end
