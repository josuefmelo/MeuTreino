//
//  SemanaService.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 29/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "SemanaService.h"
#import "Semana.h"

@implementation SemanaService

-(void)initDB{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"meutreino.sqlite"];
    
    database = [FMDatabase databaseWithPath:path];
    [database open];
    
    [database executeUpdate:@"create table semana (id INTEGER PRIMARY KEY,semana INTEGER , id_planilha INTEGER, foreign key (id_planilha) references planilha(id))"];
    
  
}


- (void)insert:(Semana *)semana{
    [self initDB];
    
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO semana(semana, id_planilha) VALUES (%i, %i)",
                           semana.semana, semana.idPlanilha];
    BOOL success = [database executeUpdate:insertSQL];
    
    semana.key = [database lastInsertRowId];
    
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao incluir a SEMANA" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
}

- (void)update:(Semana *)semana{
    [self initDB];
    
    NSString *insertSQL = [NSString stringWithFormat:@"UPDATE semana set semana = %i, id_planilha = %i WHERE id = %i",
                           semana.semana, semana.idPlanilha, semana.key];
    BOOL success = [database executeUpdate:insertSQL];
        
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao alterar a SEMANA" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
}
-(void)remove:(NSInteger)idSemana{
    [self initDB];
    
    NSString *insertSQL = [NSString stringWithFormat:@"DELETE FROM semana where id = %i",idSemana];
    BOOL success = [database executeUpdate:insertSQL];
    
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao excluir a SEMANA" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
}
-(NSMutableArray*) listByPlanilha:(NSInteger) key{
    
    [self initDB];
    NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM semana where id_planilha = %i ORDER BY semana", key];
    FMResultSet *results = [database executeQuery:querySQL];
    NSMutableArray* listReturn = [[NSMutableArray alloc]init];
    while([results next]) {
        Semana* semana = [[Semana alloc] init] ;
        semana.key = [results intForColumn:@"id"];
        semana.semana = [results intForColumn:@"semana"];
        semana.idPlanilha =  key ;
        [listReturn  addObject:semana];
    }
    [database close];
    return  listReturn;
    
}

@end
