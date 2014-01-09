//
//  AtividadeDiaService.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 06/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "AtividadeDiaService.h"

@implementation AtividadeDiaService
-(void)initDB{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"meutreino.sqlite"];
    
    database = [FMDatabase databaseWithPath:path];
    [database open];
    
    [database executeUpdate:@"create table atividade_dia (id INTEGER PRIMARY KEY,id_atividade INTEGER, atividade text,detalhe_atividade text, quantidade text , observacao text,feito INTEGER, id_dia_treino INTEGER, foreign key (id_dia_treino) references dia_treino(id), foreign key (id_atividade) references atividade(id))"];
    
}
- (void)removeWithDiaTreino:(int)idDiaTreino{
    [self initDB];
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM atividade_dia WHERE id_dia_treino = %i",idDiaTreino];
    BOOL success = [database executeUpdate:sql];
    if(!success){
        [NSException raise:@"Erro ao finalizar o TREINO" format:@"ERRO: %@", database.lastErrorMessage];
    }
    [database close];
}

-(int) converteEmSegundosCorridaLeveComKM:(int)km andMetros:(int)metros{
    return [self converteEmSegundosTroteComKM:km andMetros:metros];
}
- (int) converteEmSegundosCaminhadaComKM:(int)km andMetros:(int)metros{
    int segundos = 0;
    
    int m = metros + (km*1000);
    //5km/h == 1.39m/s
    double ms = 1.39;
    
    segundos = m/ms;
    
    return segundos;
}

-(int) converteEmSegundosCorridaModeradaComKM:(int)km andMetros:(int)metros{
    int segundos = 0;
    
    int m = metros + (km*1000);
    //8,5km/h == 2.36m/s
    double ms = 2.36;
    
    segundos = m/ms;

    return segundos;
}

-(int) converteEmSegundosTirosComKM:(int)km andMetros:(int)metros{
    int segundos = 0;
    
    int m = metros + (km*1000);
    //10km/h == 2,78m/s
    double ms = 2.78;
    
    segundos = m/ms;
    
    return segundos;
}

-(int) converteEmSegundosCorridaForteComKM:(int)km andMetros:(int)metros{
    int segundos = 0;
    
    int m = metros + (km*1000);
    //9,5km/h == 2,64m/s
    double ms = 2.64;
    
    segundos = m/ms;
    
    return segundos;
}

-(int) converteEmSegundosRitimoMeiaMaratonaComKM:(int)km andMetros:(int)metros{
    int segundos = 0;
    
    int m = metros + (km*1000);
    //8 km/h == 2.22m/s
    double ms = 2.22;
    
    segundos = m/ms;
    
    return segundos;
}

-(int) converteEmSegundosRitimo10ComKM:(int)km andMetros:(int)metros{
    int segundos = 0;
    
    int m = metros + (km*1000);
    //8 km/h == 2.22m/s
    double ms = 2.22;
    
    segundos = m/ms;
    
    return segundos;
}

-(int) converteEmSegundosRitimo5ComKM:(int)km andMetros:(int)metros{
    int segundos = 0;
    
    int m = metros + (km*1000);
    //8 km/h == 2.22m/s
    double ms = 2.22;
    
    segundos = m/ms;
    
    return segundos;
}


-(int) converteEmSegundosTroteComKM:(int)km andMetros:(int)metros{
    int segundos = 0;
    
    int m = metros + (km*1000);
    //7,5 km/h == 2.08m/s
    double ms = 2.08;
    
    segundos = m/ms;
    
    return segundos;
}


- (void)remove:(int)key{
    [self initDB];
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM atividade_dia WHERE id = %i",key];
    BOOL success = [database executeUpdate:sql];
    if(!success){
        [NSException raise:@"Erro ao finalizar o TREINO" format:@"ERRO: %@", database.lastErrorMessage];
    }
    [database close];
}

-(void)insert:(AtividadeDia *)obj{
    [self initDB];
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO atividade_dia(id_atividade , atividade,detalhe_atividade,observacao, feito, id_dia_treino, quantidade) VALUES (%i,'%@','%@','%@',%i,%i,'%@')",
                     obj.idAtividade, obj.atividade,obj.detalheAtividade,obj.observacao, obj.feito, obj.idDiaTreino, obj.quantidade];
    BOOL success = [database executeUpdate:sql];
    
    obj.key = [database lastInsertRowId];
    
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao incluir o ATIVIDADEDIA" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
}

-(void)updateFeito:(AtividadeDia *)obj{
    [self initDB];
    
    NSString *sql = [NSString stringWithFormat:@"UPDATE atividade_dia SET feito =%i  WHERE id = %i",obj.feito, obj.key];
    BOOL success = [database executeUpdate:sql];
    
    [database close];
    
    if(!success){
        [NSException raise:@"Erro ao alterar o ATIVIDADEDIA" format:@"ERRO: %@", database.lastErrorMessage];
        
    }
}

- (NSMutableArray*) listByTreino:(NSInteger)idTreino andDia:(long) dia{
    [self initDB];
    NSString *querySQL =[NSString stringWithFormat: @"SELECT ad.* FROM treino t, dia_treino dt, atividade_dia ad where t.id = dt.id_treino and dt.id = ad.id_dia_treino and t.id=%i and dt.dia = %li ORDER BY dt.dia, ad.id ",idTreino, dia];
    FMResultSet *results = [database executeQuery:querySQL];
    NSMutableArray* listReturn = [[NSMutableArray alloc]init];
    while([results next]) {
        AtividadeDia* at = [[AtividadeDia alloc] init] ;
        at.key = [results intForColumn:@"id"];
        at.atividade = [results stringForColumn:@"atividade"];
        at.idAtividade = [results intForColumn:@"id_atividade"];
        at.quantidade = [results stringForColumn:@"quantidade"];
        at.idDiaTreino = [results longForColumn:@"id_dia_treino"];
        at.feito = [results boolForColumn:@"feito"];
        at.observacao = [results stringForColumn:@"observacao"];
        at.detalheAtividade = [results stringForColumn:@"detalhe_atividade"];
        [listReturn  addObject:at];
        
    }
    [database close];
    return  listReturn ;
    
}

@end
