//
//  TreinoService.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 06/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "TreinoService.h"
#import "Treino.h"

@implementation TreinoService

-(void)initDB{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"meutreino.sqlite"];
    
    database = [FMDatabase databaseWithPath:path];
    [database open];
    
    [database executeUpdate:@"create table treino (id INTEGER PRIMARY KEY,planilha text, id_planilha INTEGER, data_inicio INTEGER, data_fim INTEGER)"];
    
}

- (void)insert:(Treino *)obj{
    [self initDB];
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO treino(planilha, id_planilha, data_inicio, data_fim) VALUES ('%@', %i, %li, %li)",
                           obj.planilha, obj.idPlanilha, obj.dataInicio, obj.dataFim];
    BOOL success = [database executeUpdate:sql];
    
    obj.key = [database lastInsertRowId];
    
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao incluir o TREINO" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
}

- (void)finalizar:(Treino *)obj{
    [self initDB];
    
    NSString *sql = [NSString stringWithFormat:@"UPDATE treino SET data_fim = %li WHERE id = %i",
                     obj.dataFim, obj.key];
    BOOL success = [database executeUpdate:sql];
   
    
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao finalizar o TREINO" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
}

- (void)remove:(int)key{
    [self initDB];
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM treino WHERE id = %i",key];
    BOOL success = [database executeUpdate:sql];
    if(!success){
        [NSException raise:@"Erro ao finalizar o TREINO" format:@"ERRO: %@", database.lastErrorMessage];
    }
    [database close];
}

- (Treino*) get{
    [self initDB];
    NSString *querySQL = @"SELECT * FROM treino where data_fim = 0";
    FMResultSet *results = [database executeQuery:querySQL];
    Treino* obj = [[Treino alloc] init] ;
    if([results next]) {
        obj.planilha = [results stringForColumn:@"planilha"];
        obj.dataInicio = [results longForColumn:@"data_inicio"];
        obj.idPlanilha = [results intForColumn:@"id_planilha"];
        obj.key = [results intForColumn:@"id"];
       
    }
    [database close];
    return  obj;
}
- (NSMutableArray*) listAllRealizadas{
    [self initDB];
    NSString *querySQL = @"SELECT * FROM treino where data_fim <> 0 order by data_fim ";
    FMResultSet *results = [database executeQuery:querySQL];
    NSMutableArray *listReturn = [[NSMutableArray alloc]init];
    while([results next]) {
        Treino* obj = [[Treino alloc] init] ;
        obj.planilha = [results stringForColumn:@"planilha"];
        obj.dataInicio = [results longForColumn:@"data_inicio"];
        obj.idPlanilha = [results intForColumn:@"id_planilha"];
        obj.dataFim = [results longForColumn:@"data_fim"];
        obj.key = [results intForColumn:@"id"];
        [listReturn addObject:obj];
    }
    [database close];
    return  listReturn;
}
- (NSMutableArray*) listAll{
    [self initDB];
    NSString *querySQL = @"SELECT * FROM treino order by data_fim";
    FMResultSet *results = [database executeQuery:querySQL];
    NSMutableArray *listReturn = [[NSMutableArray alloc]init];
    while([results next]) {
        Treino* obj = [[Treino alloc] init] ;
        obj.planilha = [results stringForColumn:@"planilha"];
        obj.dataInicio = [results longForColumn:@"data_inicio"];
        obj.idPlanilha = [results intForColumn:@"id_planilha"];
        obj.dataFim = [results longForColumn:@"data_fim"];
        obj.key = [results intForColumn:@"id"];
        [listReturn addObject:obj];
    }
    [database close];
    return  listReturn;
}
@end
