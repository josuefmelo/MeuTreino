//
//  AtividadeDiaService.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 06/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AtividadeDia.h"

@interface AtividadeDiaService : NSObject{
    FMDatabase *database;
}
- (void)insert:(AtividadeDia *)obj;

- (NSMutableArray*) listByTreino:(NSInteger)idTreino andDia:(long) dia;

-(void) updateFeito:(AtividadeDia *)obj;
- (void) remove:(int)key;
- (void) removeWithDiaTreino:(int)idDiaTreino;
- (int) converteEmSegundosTirosComKM:(int)km andMetros:(int)metros; 
- (int) converteEmSegundosCaminhadaComKM:(int)km andMetros:(int)metros;
- (int) converteEmSegundosTroteComKM:(int)km andMetros:(int)metros;
- (int) converteEmSegundosRitimo5ComKM:(int)km andMetros:(int)metros;
- (int) converteEmSegundosRitimo10ComKM:(int)km andMetros:(int)metros;
- (int) converteEmSegundosRitimoMeiaMaratonaComKM:(int)km andMetros:(int)metros;
- (int) converteEmSegundosCorridaLeveComKM:(int)km andMetros:(int)metros;
- (int) converteEmSegundosCorridaForteComKM:(int)km andMetros:(int)metros;
- (int) converteEmSegundosCorridaModeradaComKM:(int)km andMetros:(int)metros;
@end
