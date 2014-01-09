//
//  AtletaService.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 02/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "AtletaService.h"

@implementation AtletaService


-(void)initDB{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"meutreino.sqlite"];
    
    database = [FMDatabase databaseWithPath:path];
    [database open];
    
    [database executeUpdate:@"create table atleta (id INTEGER PRIMARY KEY,name text, data_nasc text, peso REAL, altura REAL)"];
    
}
- (Atleta*) get{
    [self initDB];
    NSString *querySQL = @"SELECT * FROM atleta";
    FMResultSet *results = [database executeQuery:querySQL];
    Atleta* at = [[Atleta alloc] init] ;
    if([results next]) {
        at.name = [results stringForColumn:@"name"];
        at.dataNascimento = [results stringForColumn:@"data_nasc"];
        at.peso = [results doubleForColumn:@"peso"];
        at.altura = [results doubleForColumn:@"altura"];
        at.key = [results intForColumn:@"id"];
    }else{
        BOOL success =   [database executeUpdate:@"insert into atleta(name,data_nasc,peso,altura) values(\"\", \"\", 0, 0)"];
        
        if(!success){
            [NSException raise:@"Erro ao alterar o Atleta" format:@"ERRO: %@", database.lastErrorMessage];
            
        }
        at.key = [database lastInsertRowId];
    }
    [database close];
    return  at;
}
-(void)update:(Atleta *)at{
    [self initDB];
    
    NSString *insertSQL = [NSString stringWithFormat:@"UPDATE atleta SET name = \"%@\", data_nasc = \"%@\", peso = %f, altura = %f where id = %i",at.name, at.dataNascimento, at.peso, at.altura, at.key];
    BOOL success = [database executeUpdate:insertSQL];
    
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao alterar o Atleta" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
    
}
@end
