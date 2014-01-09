//
//  DiaTreinoService.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 06/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "DiaTreinoService.h"

@implementation DiaTreinoService
-(void)initDB{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"meutreino.sqlite"];
    
    database = [FMDatabase databaseWithPath:path];
    [database open];
    
    [database executeUpdate:@"create table dia_treino (id INTEGER PRIMARY KEY,dia  INTEGER, id_treino INTEGER, foreign key (id_treino) references treino(id))"];
    
}

- (void)insert:(DiaTreino *)obj{
    [self initDB];
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO dia_treino(dia, id_treino) VALUES (%li, %i)",
                     obj.dia, obj.idTreino];
    BOOL success = [database executeUpdate:sql];
    
    obj.key = [database lastInsertRowId];
    
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao incluir o DIATREINO" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
}

- (void)remove:(int)key{
    [self initDB];
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM dia_treino WHERE id = %i",key];
    BOOL success = [database executeUpdate:sql];
    if(!success){
        [NSException raise:@"Erro ao finalizar o dia_treino" format:@"ERRO: %@", database.lastErrorMessage];
    }
    [database close];
}

- (NSMutableArray*) listByTreino:(NSInteger)idTreino {
    [self initDB];
    NSString *querySQL =[NSString stringWithFormat: @"SELECT distinct dt.* FROM treino t, dia_treino dt, atividade_dia ad where t.id = dt.id_treino and dt.id = ad.id_dia_treino and t.id=%i  ORDER BY dt.dia",idTreino];
    FMResultSet *results = [database executeQuery:querySQL];
    NSMutableArray* listReturn = [[NSMutableArray alloc]init];
    while([results next]) {
        DiaTreino* obj = [[DiaTreino alloc] init] ;
        obj.key = [results intForColumn:@"id"];
        obj.dia = [results longForColumn:@"dia"];
        obj.idTreino = idTreino;
                
        [listReturn  addObject:obj];
        
    }
    [database close];
    return  listReturn ;
    
}




@end
