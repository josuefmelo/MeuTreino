//
//  AtividadeService.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 01/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "AtividadeService.h"
#import "Atividade.h"

@implementation AtividadeService

-(void)initDB{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"meutreino.sqlite"];
    
    database = [FMDatabase databaseWithPath:path];
    [database open];
    
    [database executeUpdate:@"create table atividade (id INTEGER PRIMARY KEY,atividade text, detalhe_atividade, quantidade text, observacao text, dia_semana INTEGER, id_semana INTEGER, foreign key (id_semana) references semana(id))"];
    
}

-(void)insert:(Atividade*)at{
    [self initDB];
    
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO atividade(atividade, detalhe_atividade, quantidade, observacao, dia_semana, id_semana) VALUES (\"%@\", \"%@\", \"%@\",\"%@\",%i, %i)",
                           at.atividade, at.detalheAtividade, at.quantidade, at.observacao, at.diaSemana, at.idSemana];
    BOOL success = [database executeUpdate:insertSQL];
    
    at.key = [database lastInsertRowId];
    
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao incluir a ATIVIDADE" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
}

-(void)remove:(NSInteger) key{
    [self initDB];
    
    NSString *SQL = [NSString stringWithFormat:@"DELETE FROM atividade WHERE id = %i",key];
    BOOL success = [database executeUpdate:SQL];
    
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao excluir a ATIVIDADE" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
}

- (NSMutableArray*) listBySemana:(NSInteger) idSemana andDiaSemana:(NSInteger) dia{
    [self initDB];
    NSString *querySQL =[NSString stringWithFormat: @"SELECT * FROM atividade where id_semana = %i and dia_semana = %i ORDER BY id", idSemana, dia];
    FMResultSet *results = [database executeQuery:querySQL];
    NSMutableArray* listReturn = [[NSMutableArray alloc]init];
    while([results next]) {
        Atividade* at = [[Atividade alloc] init] ;
        at.key = [results intForColumn:@"id"];
        at.quantidade = [results stringForColumn:@"quantidade"];
        at.atividade = [results stringForColumn:@"atividade"];
        at.detalheAtividade = [results stringForColumn:@"detalhe_atividade"];
        at.observacao = [results stringForColumn:@"observacao"];
        at.idSemana = idSemana;
        at.diaSemana = dia;
        [listReturn  addObject:at];
        
    }
    [database close];
    return  listReturn ;
    
}
-(void)removeBySemana:(NSInteger)idSemana{
    [self initDB];
    
    NSString *insertSQL = [NSString stringWithFormat:@"DELETE FROM atividade where id_semana = %i",idSemana];
    BOOL success = [database executeUpdate:insertSQL];
    
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao excluir a ATIVIDADE" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
    
}

@end
