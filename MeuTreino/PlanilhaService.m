//
//  TreinoService.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 27/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "PlanilhaService.h"



@implementation PlanilhaService


-(void)initDB{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"meutreino.sqlite"];
    
    database = [FMDatabase databaseWithPath:path];
    [database open];
    
     [database executeUpdate:@"create table planilha (id INTEGER PRIMARY KEY,objetivo text, pode_editar INTEGER)"];
//    if(!success){
//        [NSException raise:@"Erro ao criar a tabela planilha" format:@"ERRO: %@", database.lastErrorMessage];
    
//    }
}

- (void)insert:(Planilha *)planilha{
    [self initDB];
    
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO planilha(objetivo, pode_editar) VALUES (\"%@\", %i)",
                           planilha.objetivo, planilha.podeEditar];
    BOOL success = [database executeUpdate:insertSQL];
    
    planilha.key = [database lastInsertRowId];
    
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao incluir o planilha" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
}
-(void)update:(Planilha *)planilha{
    [self initDB];
    
    NSString *insertSQL = [NSString stringWithFormat:@"UPDATE planilha SET objetivo = \"%@\" where id = %i",
                           planilha.objetivo, planilha.key];
    BOOL success = [database executeUpdate:insertSQL];
        
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao alterar o planilha" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
   
}
-(void)remove:(NSInteger)key{
    [self initDB];
    
    NSString *insertSQL = [NSString stringWithFormat:@"DELETE FROM planilha where id = %i",key];
    BOOL success = [database executeUpdate:insertSQL];
        
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao excluir o planilha" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
    
}
- (NSMutableArray*) listAll{
    [self initDB];
    NSString *querySQL = @"SELECT * FROM planilha WHERE objetivo != \"(null)\"";
    FMResultSet *results = [database executeQuery:querySQL];
    NSMutableArray* listReturn = [[NSMutableArray alloc]init];
    while([results next]) {
        Planilha* t = [[Planilha alloc] init] ;
        t.key = [results intForColumn:@"id"];
        t.podeEditar = [results intForColumn:@"pode_editar"];
        t.objetivo = [results stringForColumn:@"objetivo"];
        [listReturn  addObject:t];
    }
    [database close];
    return  listReturn;

}

@end
