//
//  LoadDataBase.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 16/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "LoadDataBase.h"
#import "Planilha.h"
#import "PlanilhaService.h"
#import "Semana.h"
#import "SemanaService.h"
#import "Atividade.h"
#import "AtividadeService.h"

@implementation LoadDataBase


- (void) initData{
    [self insertPlanilhaWithTitle:@"A porta de saída do sedentarismo rumo à saude" andSemanas:12 andList:[self list1]];
    NSMutableArray *l = nil;
    l = [self list7];
    [self insertPlanilhaWithTitle:@"Perca Peso Correndo" andSemanas:[l count] andList:l];
    l = [self list2];
    [self insertPlanilhaWithTitle:@"Voe nos 5 Km - Para iniciantes" andSemanas:[l count] andList:l];
    l = [self list3];
    [self insertPlanilhaWithTitle:@"Voe nos 5 Km - Para iniciados" andSemanas:[l count] andList:l];
    l = [self list8];
    [self insertPlanilhaWithTitle:@"10 km na esteira" andSemanas:[l count] andList:l];
    l = [self list4];
    [self insertPlanilhaWithTitle:@"10 Km - Por Diversão" andSemanas:[l count] andList:l];
    l = [self list5];
    [self insertPlanilhaWithTitle:@"Gordinhos e Veteranos" andSemanas:[l count] andList:l];
    l = [self list6];
    [self insertPlanilhaWithTitle:@"10 km abaixo dos 45 min" andSemanas:[l count] andList:l];
    
}
-(NSMutableArray*)list8{
    NSMutableArray *list = [[NSMutableArray alloc]init];
    NSMutableArray *listAtividades = nil;
    Atividade *ativ = nil;
    NSMutableArray *listDiaSemana = [[NSMutableArray alloc]init];
    
    //////////////1 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////2 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaModeradaWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    for (int i=0; i<5; i++) {
        ativ = [self getCorridaForteWithHora:0 andMinutos:3];
        [listAtividades addObject:ativ];
        ativ = [self getRecuperacaoWithMin:2 andSegundos:0 ];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithHora:1 andMinuto:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    //////////////3 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    for (int i=0; i<4; i++) {
        ativ = [self getCorridaModeradaWithKM:1 andMetros:0];
        [listAtividades addObject:ativ];
        ativ = [self getRecuperacaoWithMin:2 andSegundos:0 ];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<2; i++) {
        ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
        [listAtividades addObject:ativ];
        ativ = [self getCorridaModeradaWithHora:0 andMinuto:10 ];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    for (int i=0; i<2; i++) {
        ativ = [self getCorridaModeradaWithHora:0 andMinuto:10];
        [listAtividades addObject:ativ];
        ativ = [self getRecuperacaoWithMin:2 andSegundos:0 ];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////4 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaProva];
    ativ.observacao=@"10 km na esteira";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    for (int i=0; i<4; i++) {
        ativ = [self getCorridaModeradaWithKM:1 andMetros:0];
        [listAtividades addObject:ativ];
        ativ = [self getRecuperacaoWithMin:2 andSegundos:0 ];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    for (int i=0; i<6; i++) {
        ativ = [self getCorridaForteWithHora:0 andMinutos:1];
        [listAtividades addObject:ativ];
        ativ = [self getRecuperacaoWithMin:2 andSegundos:0 ];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:0 andMinuto:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithHora:0 andMinuto:40];
    ativ.observacao = @"Opcional - 30 a 40 min";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    return list;
}
-(NSMutableArray*)list7{
    NSMutableArray *list = [[NSMutableArray alloc]init];
    NSMutableArray *listAtividades = nil;
    Atividade *ativ = nil;
    NSMutableArray *listDiaSemana = [[NSMutableArray alloc]init];
    //////////////1 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:40];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:40];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////2 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:40];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:40];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];

    //////////////3 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:40];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];

    //////////////4 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:40];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    return list;
}
-(NSMutableArray*)list6{
    NSMutableArray *list = [[NSMutableArray alloc]init];
    NSMutableArray *listAtividades = nil;
    Atividade *ativ = nil;
    NSMutableArray *listDiaSemana = [[NSMutableArray alloc]init];
    //////////////1 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:0 andMinuto:40];
    [listAtividades addObject:ativ];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<5; i++) {
        ativ = [self getCorridaForteWithKM:1 andMetros:0];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    for (int i=0; i<5; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:200];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:0 andMinuto:40];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:0 andMinuto:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithKM:14 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    //////////////2 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:0 andMinuto:40];
    [listAtividades addObject:ativ];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<5; i++) {
        ativ = [self getCorridaForteWithKM:1 andMetros:0];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:30];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<5; i++) {
        ativ = [self getCorridaForteWithKM:1 andMetros:0];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:30];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:0 andMinuto:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithKM:15 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////3 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:0 andMinuto:50];
    [listAtividades addObject:ativ];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:100];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i< 5; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:600];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:30];
        [listAtividades addObject:ativ];
    }
    for (int i=0; i< 5; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:400];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:30];
        [listAtividades addObject:ativ];
    }
    for (int i=0; i< 5; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:200];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:30];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:0 andMinuto:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithKM:15 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////4 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:0 andMinuto:50];
    [listAtividades addObject:ativ];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<20; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:200];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i< 4; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:800];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    for (int i=0; i< 4; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:400];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:30];
        [listAtividades addObject:ativ];
    }
    for (int i=0; i< 4; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:200];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithKM:15 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////5 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<20; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:400];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:30];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i< 4; i++) {
        ativ = [self getCorridaForteWithKM:1 andMetros:0];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    for (int i=0; i< 4; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:800];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:30];
        [listAtividades addObject:ativ];
    }
    for (int i=0; i< 4; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:200];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithKM:5 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaModeradaWithKM:5 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaForteWithKM:5 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////6 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:300];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getCorridaLeveWithKM:4 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaForteWithKM:1 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i< 10; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:600];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:30];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithKM:5 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaModeradaWithKM:5 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaForteWithKM:5 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////7 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:300];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getCorridaLeveWithKM:4 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaForteWithKM:1 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i< 10; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:400];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:0 andSegundos:50];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithKM:5 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaModeradaWithKM:5 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaForteWithKM:5 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////8 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i< 10; i++) {
        ativ = [self getCorridaForteWithKM:1 andMetros:0];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i< 10; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:300];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithKM:5 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaModeradaWithKM:5 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaForteWithKM:5 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////9 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:300];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getCorridaLeveWithKM:4 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaForteWithKM:1 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i< 6; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:800];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    for (int i=0; i< 10; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:400];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:30];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaForteWithKM:15 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    //////////////10 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:300];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getCorridaLeveWithKM:4 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaForteWithKM:1 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i< 10; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:800];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaForteWithKM:15 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
   
    //////////////11 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<3; i++) {
        ativ = [self getCorridaForteWithKM:1 andMetros:0];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i< 3; i++) {
        ativ = [self getCorridaForteWithKM:1 andMetros:0];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaForteWithKM:15 andMetros:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////12 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaProva];
    ativ.observacao=@"Correr 10km abaixo dos 45";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaModeradaWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    ativ = [self getMusculacao];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<5; i++) {
        ativ = [self getCorridaForteWithKM:0 andMetros:400];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:40];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:40];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:40];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    
    [list addObject:listDiaSemana];
    
    return list;
}
-(NSMutableArray*)list5{
    NSMutableArray *list = [[NSMutableArray alloc]init];
    NSMutableArray *listAtividades = nil;
    Atividade *ativ = nil;
    NSMutableArray *listDiaSemana = [[NSMutableArray alloc]init];
    //////////////1 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getAlongamento];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCaminhadaWithMin:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getAlongamento];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCaminhadaWithMin:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCaminhadaWithMin:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////2 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getAlongamento];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<5; i++) {
        ativ = [self getTroteRegenartivoWithMin:3];
        ativ.observacao = @"Ou caminhada rápida";
        [listAtividades addObject:ativ];
        ativ = [self getCaminhadaWithMin:2];
        [listAtividades addObject:ativ];
    }
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getAlongamento];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCaminhadaWithMin:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<6; i++) {
        ativ = [self getTroteRegenartivoWithMin:3];
        ativ.observacao = @"Ou caminhada rápida";
        [listAtividades addObject:ativ];
        ativ = [self getCaminhadaWithMin:2];
        [listAtividades addObject:ativ];
    }
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////3 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getAlongamento];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<2; i++) {
        ativ = [self getTroteRegenartivoWithMin:15];
        ativ.observacao = @"Ou caminhada rápida";
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getAlongamento];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCaminhadaWithMin:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<6; i++) {   
        ativ = [self getTroteRegenartivoWithMin:3];
        ativ.observacao = @"Ou caminhada rápida";
        [listAtividades addObject:ativ];
        ativ = [self getCaminhadaWithMin:2];
        [listAtividades addObject:ativ];
    }
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////4 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getAlongamento];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCaminhadaWithMin:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getAlongamento];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<5   ; i++) {
        ativ = [self getTroteRegenartivoWithMin:4];
        ativ.observacao = @"Ou caminhada rápida";
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:1 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<2   ; i++) {
        ativ = [self getTroteRegenartivoWithMin:20];
        ativ.observacao = @"Ou caminhada rápida";
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    return list;
}
-(NSMutableArray*)list4{
    NSMutableArray *list = [[NSMutableArray alloc]init];
    NSMutableArray *listAtividades = nil;
    Atividade *ativ = nil;
    NSMutableArray *listDiaSemana = [[NSMutableArray alloc]init];
    //////////////1 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<4; i++) {
        ativ = [self getCorridaModeradaWithHora:0 andMinuto:3];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        ativ.observacao = @"Andando";
        [listAtividades addObject:ativ];
    }
    
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<3; i++) {
        ativ = [self getCorridaLeveWithHora:0 andMinuto:7];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:3 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaLeveWithHora:0 andMinuto:30];
    ativ.observacao = @"Alternar com Caminhada - FC até 80%";
    [listAtividades addObject:ativ];
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////2 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<4; i++) {
        ativ = [self getCorridaModeradaWithHora:0 andMinuto:3];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        ativ.observacao = @"Andando";
        [listAtividades addObject:ativ];
    }
    
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<4; i++) {
        ativ = [self getCorridaLeveWithHora:0 andMinuto:7];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:3 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaLeveWithHora:0 andMinuto:40];
    ativ.observacao = @"Alternar com Caminhada - FC até 80%";
    [listAtividades addObject:ativ];
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    
    //////////////3 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<4; i++) {
        ativ = [self getCorridaModeradaWithHora:0 andMinuto:5];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        ativ.observacao = @"Andando";
        [listAtividades addObject:ativ];
    }
    
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<4; i++) {
        ativ = [self getCorridaLeveWithHora:0 andMinuto:8];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    ativ = [self getCorridaLeveWithHora:0 andMinuto:40];
    ativ.observacao = @"Alternar com Caminhada - FC até 80%";
    [listAtividades addObject:ativ];
    ativ = [self getCaminhadaWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////4 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<4; i++) {
        ativ = [self getCorridaModeradaWithHora:0 andMinuto:5];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        ativ.observacao = @"Andando";
        [listAtividades addObject:ativ];
    }
    
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<3; i++) {
        ativ = [self getCorridaLeveWithHora:0 andMinuto:10];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:3 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<2; i++) {
        ativ = [self getCorridaLeveWithHora:0 andMinuto:25];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////5 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<3; i++) {
        ativ = [self getCorridaModeradaWithHora:0 andMinuto:10];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        ativ.observacao = @"Andando";
        [listAtividades addObject:ativ];
    }
    
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<3; i++) {
        ativ = [self getCorridaLeveWithHora:0 andMinuto:10];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:3 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<2; i++) {
        ativ = [self getCorridaLeveWithHora:0 andMinuto:30];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////6 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<3; i++) {
        ativ = [self getCorridaModeradaWithHora:0 andMinuto:10];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        ativ.observacao = @"Andando";
        [listAtividades addObject:ativ];
    }
    
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<2; i++) {
        ativ = [self getCorridaLeveWithHora:0 andMinuto:12];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    for (int i=0; i<2; i++) {
        ativ = [self getCorridaLeveWithHora:0 andMinuto:30];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////7 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<4; i++) {
        ativ = [self getCorridaModeradaWithHora:0 andMinuto:10];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        ativ.observacao = @"Andando";
        [listAtividades addObject:ativ];
    }
    
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    for (int i=0; i<2; i++) {
        ativ = [self getCorridaLeveWithHora:0 andMinuto:12];
        [listAtividades addObject:ativ];
        ativ = [self getIntervaloWithMin:2 andSegundos:0];
        [listAtividades addObject:ativ];
    }
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:0 andMinuto:50];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////8 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaProva];
    ativ.observacao = @"Correr 10 km";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    
    ativ = [self getCorridaModeradaWithHora:0 andMinuto:25];
    ativ.observacao = @"Alternando 3 min de corrida e 2 min andando.";
    [listAtividades addObject:ativ];
    ativ = [self getTroteRegenartivoWithMin:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:0 andMinuto:40];
    ativ.observacao =@"30 a 40 minutos";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:0 andMinuto:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    return  list;
}
-(NSMutableArray*)list3{
    NSMutableArray *list = [[NSMutableArray alloc]init];
    NSMutableArray *listAtividades = nil;
    Atividade *ativ = nil;
    NSMutableArray *listDiaSemana = [[NSMutableArray alloc]init];
    //////////////1 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getRitmoMeiaMaratonaWithHora:0 andMninuto:10 andSegundo:0];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRitmoMeiaMaratonaWithHora:0 andMninuto:10 andSegundo:0];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:30];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1];
    ativ.observacao = @"Treino Longo";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////2 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getRitmoMeiaMaratonaWithHora:0 andMninuto:25 andSegundo:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:50];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:10];
    ativ.observacao = @"Treino Longo";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////3 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getRitmoMeiaMaratonaWithHora:0 andMninuto:30 andSegundo:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:50];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:10];
    ativ.observacao = @"Treino Longo";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////4 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getRitmo10WithKM:0 andMetros:600];
    ativ.observacao =  @"Pode-se optar por 3 min no lugar dos 600m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:1 andSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:0 andMetros:600];
    ativ.observacao =  @"Pode-se optar por 3 min no lugar dos 600m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:1 andSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:0 andMetros:600];
    ativ.observacao =  @"Pode-se optar por 3 min no lugar dos 600m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:1 andSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:0 andMetros:600];
    ativ.observacao =  @"Pode-se optar por 3 min no lugar dos 600m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:1 andSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:0 andMetros:600];
    ativ.observacao =  @"Pode-se optar por 3 min no lugar dos 600m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:1 andSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:0 andMetros:600];
    ativ.observacao =  @"Pode-se optar por 3 min no lugar dos 600m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:1 andSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:0 andMetros:600];
    ativ.observacao =  @"Pode-se optar por 3 min no lugar dos 600m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:1 andSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:0 andMetros:600];
    ativ.observacao =  @"Pode-se optar por 3 min no lugar dos 600m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:1 andSegundos:30];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    ativ = [self getSUBWithMetros:100];
    ativ.observacao = @"Pode-se optar por 30 seg no lugar dos 100m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:0 andSegundos:45];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:15];
    ativ.observacao = @"Treino Longo";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////5 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaProva];
    ativ.observacao = @"Correr 5Km";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getRitmo10WithKM:1 andMetros:200];
    ativ.observacao =  @"Pode-se optar por 6 min no lugar dos 1km e 200m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:1 andMetros:200];
    ativ.observacao =  @"Pode-se optar por 6 min no lugar dos 1km e 200m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:1 andMetros:200];
    ativ.observacao =  @"Pode-se optar por 6 min no lugar dos 1km e 200m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:1 andMetros:200];
    ativ.observacao =  @"Pode-se optar por 6 min no lugar dos 1km e 200m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:1 andMetros:200];
    ativ.observacao =  @"Pode-se optar por 6 min no lugar dos 1km e 200m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:50];
    ativ.observacao = @"Pode-se optar por 15 seg no lugar dos 50m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:50];
    ativ.observacao = @"Pode-se optar por 15 seg no lugar dos 50m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:50];
    ativ.observacao = @"Pode-se optar por 15 seg no lugar dos 50m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:50];
    ativ.observacao = @"Pode-se optar por 15 seg no lugar dos 50m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:50];
    ativ.observacao = @"Pode-se optar por 15 seg no lugar dos 50m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:50];
    ativ.observacao = @"Pode-se optar por 15 seg no lugar dos 50m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:15];
    ativ.observacao = @"Treino Longo";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    //////////////6 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getRitmo5WithKM:0 andMetros:400];
    ativ.observacao =  @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo5WithKM:0 andMetros:400];
    ativ.observacao =  @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo5WithKM:0 andMetros:400];
    ativ.observacao =  @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo5WithKM:0 andMetros:400];
    ativ.observacao =  @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo5WithKM:0 andMetros:400];
    ativ.observacao =  @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo5WithKM:0 andMetros:400];
    ativ.observacao =  @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo5WithKM:0 andMetros:400];
    ativ.observacao =  @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo5WithKM:0 andMetros:400];
    ativ.observacao =  @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo5WithKM:0 andMetros:400];
    ativ.observacao =  @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo5WithKM:0 andMetros:400];
    ativ.observacao =  @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:10];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min e 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min e 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min e 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min e 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:15];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo5WithKM:3 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getTroteRegenartivoWithMin:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    //////////////7 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getRitmo5WithKM:1 andMetros:600];
    ativ.observacao =  @"Pode-se optar por 8 min no lugar dos 1km e 600m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:3 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo5WithKM:1 andMetros:600];
    ativ.observacao =  @"Pode-se optar por 8 min no lugar dos 1km e 600m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:3 andSegundos:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min E 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min E 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min E 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min E 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min E 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min E 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:15];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo5WithKM:3 andMetros:0];
    [listAtividades addObject:ativ];
    ativ = [self getTroteRegenartivoWithMin:15];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////8 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaProva];
    ativ.observacao = @"Correr 5Km";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getRitmo10WithKM:1 andMetros:0];
    ativ.observacao =  @"Pode-se optar por 5 min no lugar dos 1km";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:1 andMetros:0];
    ativ.observacao =  @"Pode-se optar por 5 min no lugar dos 1km";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:1 andMetros:0];
    ativ.observacao =  @"Pode-se optar por 5 min no lugar dos 1km";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:1 andMetros:0];
    ativ.observacao =  @"Pode-se optar por 5 min no lugar dos 1km";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getRitmo10WithKM:1 andMetros:0];
    ativ.observacao =  @"Pode-se optar por 5 min no lugar dos 1km";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1 andMinuto:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:45];
    ativ.observacao = @"Opcional - 30 a 45 min";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min E 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min E 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min E 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min E 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min E 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:150];
    ativ.observacao =  @"Pode-se optar por 1 min E 30 seg no lugar dos 150m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =  @"Pode-se optar por 250 m no lugar dos 2 min";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    return  list;
}
-(NSMutableArray*)list2{
    NSMutableArray *list = [[NSMutableArray alloc]init];
    NSMutableArray *listAtividades = nil;
    Atividade *ativ = nil;
    NSMutableArray *listDiaSemana = [[NSMutableArray alloc]init];
    //////////////1 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2  andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2  andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2  andSegundos:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =@"Caminhando";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =@"Caminhando";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =@"Caminhando";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =@"Caminhando";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:40];
    ativ.observacao = @"30 a 40 minutos";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    //////////////2 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2  andSegundos:0];
    ativ.observacao =@"Caminhando";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =@"Caminhando";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =@"Caminhando";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =@"Caminhando";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:50];
    ativ.observacao = @"40 a 50 minutos";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////3 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTirosCurtosWithMetros:800];
    ativ.observacao = @"Pode-se optar por 4 min no lugar dos 800m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:800];
    ativ.observacao = @"Pode-se optar por 4 min no lugar dos 800m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:800];
    ativ.observacao = @"Pode-se optar por 4 min no lugar dos 800m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:30];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =@"Caminhando";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =@"Caminhando";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =@"Caminhando";
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    ativ.observacao =@"Caminhando";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1];
    ativ.observacao = @"50 a 60 minutos";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////4 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:400];
    ativ.observacao = @"Pode-se optar por 2 min no lugar dos 400m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTroteRegenartivoWithMin:30];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getCrossTraining];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    ativ = [self getDiaDescanco];
    ativ.observacao = @"Opcional";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithHora:1];
    ativ.observacao = @"50 a 60 minutos";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    //////////////5 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaProva];
    ativ.observacao = @"Correr 5Km";
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getDiaDescanco];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //TERÇA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getTirosCurtosWithMetros:800];
    ativ.observacao = @"Pode-se optar por 4 min no lugar dos 800m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:800];
    ativ.observacao = @"Pode-se optar por 4 min no lugar dos 800m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithMetros:800];
    ativ.observacao = @"Pode-se optar por 4 min no lugar dos 800m";
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:30]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    ativ = [self getCorridaLeveWithMin:20];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    ativ = [self getTirosCurtosWithSegundos:30];
    [listAtividades addObject:ativ];
    ativ = [self getRecuperacaoWithMin:2 andSegundos:0];
    [listAtividades addObject:ativ];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    return list;
}

-(void) insertPlanilhaWithTitle:(NSString*)title andSemanas:(NSInteger)qtdeSemanas andList:(NSMutableArray*)list{
    Planilha *planilha = [[Planilha alloc] init];
    PlanilhaService *pService = [[PlanilhaService alloc]init];
    
    planilha.objetivo = title;
    
    qtdeSemanas = qtdeSemanas+1;
   
    [pService insert:planilha];
    Semana *sem = [[Semana alloc] init];
    SemanaService *semService = [[SemanaService alloc] init];
    
    Atividade *ativ = [[Atividade alloc]init];
    AtividadeService *ativService = [[AtividadeService alloc]init];
    for (int i =1; i < qtdeSemanas; i++) {
        sem.key = 0;
        sem.semana = i;
        sem.idPlanilha = planilha.key;
        [semService insert:sem];
        NSMutableArray *semanas = [list objectAtIndex:i-1];
        for (int j=1; j < 8; j++) {
            NSArray *atividades = [semanas objectAtIndex:j-1];
            for (Atividade *a in atividades) {
                ativ.key = 0;
                ativ.quantidade = a.quantidade;
                ativ.atividade =  a.atividade;
                ativ.diaSemana = j;
                ativ.idSemana = sem.key;
                ativ.observacao = a.observacao;
                ativ.detalheAtividade = a.detalheAtividade;
                [ativService insert:ativ];
            }
        }
    }
}

-(Atividade*)getDiaDescanco{
   Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Dia de Descanso";
    ativ.detalheAtividade = @"Quando você descansa é que melhora seu desempenho, o corpo se recupera e promove melhorias no organismo";
    return ativ;
}

-(Atividade*)getDiaProva{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Dia de Prova";
    ativ.detalheAtividade = @"Chegou o grande dia. Dia de realizar a prova de todo seu treinamento.";
    return ativ;
}
-(Atividade*)getAlongamento{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Alongamento";
    ativ.detalheAtividade = @"O alongamento é parte de um aquecimento fundamental para o esforço que vem pela frente";
    return ativ;
}
-(Atividade*)getMusculacao{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Musculação";
    ativ.detalheAtividade = @"Contribui para o fortalecimento dos músculos e articulações, ajuda prevenir lesões e melhora o desempenho do atleta";
    return ativ;
}
//[listAtividades addObject:@"Dia de Prova"];
//[listDetalheAtividades addObject:@"Chegou o grande dia. Dia de realizar a prova de todo seu treinamento."];

-(Atividade*)getCrossTraining{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Cross-training";
    ativ.detalheAtividade = @"Aqui vale tudo: natação, ciclismo, musculação ou qualquer esporte feito paralelamente";
    return ativ;
}
-(Atividade*)getRitmo10WithHora:(int)hora andMninuto:(int)min andSegundo:(int)seg{
    Atividade *ativ = [[Atividade alloc]init];
//    [listAtividades addObject:@"Ritmo de 10 km"];
//    [listDetalheAtividades addObject:@"Pace dos melhores 10km ou 10-15 seg/min mais lento que dos 5km. Entre 75%-90% da FCM"];
    ativ.atividade = @"Ritmo de 10 km";
    ativ.detalheAtividade = @"Pace dos melhores 10km ou 10-15 seg/min mais lento que dos 5km. Entre 75%-90% da FCM";
    NSString *string = [NSString stringWithFormat:@"%i h e %i min e %i seg", hora, min, seg];
    if (hora == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 h e " withString:@""];
    }
    if (min == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 min e " withString:@""];
        string  = [string stringByReplacingOccurrencesOfString:@"0 min e " withString:@""];
    }
    if (seg == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 seg" withString:@""];
        string  = [string stringByReplacingOccurrencesOfString:@"0 seg" withString:@""];
    }
    ativ.quantidade = string;
    return ativ;
}
-(Atividade*)getRitmo10WithKM:(int)km andMetros:(int)min {
    Atividade *ativ = [[Atividade alloc]init];
    //    [listAtividades addObject:@"Ritmo de 10 km"];
    //    [listDetalheAtividades addObject:@"Pace dos melhores 10km ou 10-15 seg/min mais lento que dos 5km. Entre 75%-90% da FCM"];
    ativ.atividade = @"Ritmo de 10 km";
    ativ.detalheAtividade = @"Pace dos melhores 10km ou 10-15 seg/min mais lento que dos 5km. Entre 75%-90% da FCM";
    NSString *string = [NSString stringWithFormat:@"%i km e %i m", km, min];
    if (km == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 km e " withString:@""];
    }
    if (min == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 m" withString:@""];
    }
    ativ.quantidade = string;
    return ativ;
}
-(Atividade*)getRitmo5WithKM:(int)km andMetros:(int)min {
    Atividade *ativ = [[Atividade alloc]init];
    //    [listAtividades addObject:@"Ritmo de 10 km"];
    //    [listDetalheAtividades addObject:@"Pace dos melhores 10km ou 10-15 seg/min mais lento que dos 5km. Entre 75%-90% da FCM"];
    ativ.atividade = @"Ritmo de 5 km";
    ativ.detalheAtividade = @"O exato ritmo pretendido para correr os 5K. Entre 80% e 90% da FCM";
    NSString *string = [NSString stringWithFormat:@"%i km e %i m", km, min];
    if (km == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 km e " withString:@""];
    }
    if (min == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 m" withString:@""];
    }
    ativ.quantidade = string;
    return ativ;
}

-(Atividade*)getCorridaForteWithHora:(int)hora andMinutos:(int)min {
    Atividade *ativ = [[Atividade alloc]init];

    ativ.atividade = @"Corrida Forte";
    ativ.detalheAtividade = @"Entre 85% e 95% da FCM";
    NSString *string = [NSString stringWithFormat:@"%i h e %i min", hora, min];
    if (hora == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 h e " withString:@""];
    }
    if (min == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 min" withString:@""];
        string  = [string stringByReplacingOccurrencesOfString:@"0 min" withString:@""];
    }
    ativ.quantidade =string;
    return ativ;
}
-(Atividade*)getCorridaForteWithKM:(int)km andMetros:(int)min {
    Atividade *ativ = [[Atividade alloc]init];
//    [listAtividades addObject:@"Corrida Forte"];
//    [listDetalheAtividades addObject:@"Entre 85% e 95% da FCM"];
    ativ.atividade = @"Corrida Forte";
    ativ.detalheAtividade = @"Entre 85% e 95% da FCM";
    NSString *string = [NSString stringWithFormat:@"%i km e %i m", km, min];
    if (km == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 km e " withString:@""];
    }
    if (min == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 m" withString:@""];
    }
    ativ.quantidade = string;
    return ativ;
}
-(Atividade*)getCorridaLeveWithKM:(int)km andMetros:(int)min{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Corrida Leve";
    ativ.detalheAtividade = @"Corrida em ritmo confortável. Entre 65% e 75% da FCM";
    NSString *string = [NSString stringWithFormat:@"%i km e %i m", km, min];
    if (km == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 km e " withString:@""];
    }
    if (min == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 m" withString:@""];
    }
    ativ.quantidade = string;
    return ativ;
}
-(Atividade*)getRitmoMeiaMaratonaWithHora:(int)hora andMninuto:(int)min andSegundo:(int)seg{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Ritmo de Meia Maratona";
    ativ.detalheAtividade = @"O pace da meia maratona ou ligeiramente mais rápido. Entre 70% e 85% da FCM";
    NSString *string = [NSString stringWithFormat:@"%i h e %i min e %i seg", hora, min, seg];
    if (hora == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 h e " withString:@""];
    }
    if (min == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 min e " withString:@""];
        string  = [string stringByReplacingOccurrencesOfString:@"0 min e " withString:@""];
    }
    if (seg == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 seg" withString:@""];
        string  = [string stringByReplacingOccurrencesOfString:@"0 seg" withString:@""];
    }
    ativ.quantidade = string;
    return ativ;
}
-(Atividade*)getTirosCurtosWithMetros:(int) metros{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Tiros Curtos";
    ativ.detalheAtividade = @"Corrida curta e rápida. Entre 85% e 95% da FCM";
    ativ.quantidade = [NSString stringWithFormat:@"%i m", metros];
    return ativ;
}
-(Atividade*)getTirosCurtosWithMin:(int) min{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Tiros Curtos";
    ativ.detalheAtividade = @"Corrida curta e rápida. Entre 85% e 95% da FCM";
    ativ.quantidade = [NSString stringWithFormat:@"%i min", min];
    return ativ;
}
-(Atividade*)getTirosCurtosWithSegundos:(int) min{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Tiros Curtos";
    ativ.detalheAtividade = @"Corrida curta e rápida. Entre 85% e 95% da FCM";
    ativ.quantidade = [NSString stringWithFormat:@"%i seg", min];
    return ativ;
}
-(Atividade*)getRecuperacaoWithMin:(int) minutos andSegundos:(int)seg{
    Atividade *ativ = [[Atividade alloc]init];
    
    ativ.atividade = @"Recuperação";
    ativ.detalheAtividade = @"Tempo de recuperação entre tiros. Pode ser feito caminhando ou trotando";
    NSString *string = [NSString stringWithFormat:@"%i min e %i seg", minutos, seg];
    if (minutos == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 min e " withString:@""];
    }
    if (seg == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 seg" withString:@""];
        string  = [string stringByReplacingOccurrencesOfString:@"0 seg" withString:@""];
    }
    ativ.quantidade =string;
    return ativ;
}
-(Atividade*)getIntervaloWithMin:(int) minutos andSegundos:(int)seg{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Intervalos de descanso";
    ativ.detalheAtividade = @"É uma pausa programada entre um exercício e outro";
    NSString *string = [NSString stringWithFormat:@"%i min e %i seg", minutos, seg];
    if (minutos == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 min e " withString:@""];
    }
    if (seg == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 seg" withString:@""];
        string  = [string stringByReplacingOccurrencesOfString:@"0 seg" withString:@""];
    }
    ativ.quantidade =string;
    return ativ;
}
-(Atividade*)getCorridaModeradaWithHora:(int) hora andMinuto:(int)min{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Corrida Moderada";
    ativ.detalheAtividade = @"Entre 75% e 85% da FCM";
    NSString *string = [NSString stringWithFormat:@"%i h e %i min", hora, min];
    if (hora == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 h e " withString:@""];
    }
    if (min == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 min" withString:@""];
        string  = [string stringByReplacingOccurrencesOfString:@"0 min" withString:@""];
    }
    ativ.quantidade =string;
    return ativ;
}
-(Atividade*)getCorridaModeradaWithKM:(int)km andMetros:(int)min{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Corrida Moderada";
    ativ.detalheAtividade = @"Entre 75% e 85% da FCM";
    NSString *string = [NSString stringWithFormat:@"%i km e %i m", km, min];
    if (km == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 km e " withString:@""];
    }
    if (min == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 m" withString:@""];
    }
    ativ.quantidade = string;
    return ativ;
}
-(Atividade*)getTroteRegenartivoWithHora:(int) hora andMinuto:(int)min{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Trote Regenerativo";
    ativ.detalheAtividade = @"Corrida muito lenta, devagar quase parando. Entre 60% e 70% da FCM";
    NSString *string = [NSString stringWithFormat:@"%i h e %i min", hora, min];
    if (hora == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 h e " withString:@""];
    }
    if (min == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 min" withString:@""];
        string  = [string stringByReplacingOccurrencesOfString:@"0 min" withString:@""];
    }
    ativ.quantidade =string;
    return ativ;
}
-(Atividade*)getCorridaLeveWithHora:(int) hora andMinuto:(int)min{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Corrida Leve";
    ativ.detalheAtividade = @"Corrida em ritmo confortável. Entre 65% e 75% da FCM";
    NSString *string = [NSString stringWithFormat:@"%i h e %i min", hora, min];
    if (hora == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"0 h e " withString:@""];
    }
    if (min == 0) {
        string  = [string stringByReplacingOccurrencesOfString:@"e 0 min" withString:@""];
        string  = [string stringByReplacingOccurrencesOfString:@"0 min" withString:@""];
    }
    ativ.quantidade =string;
    return ativ;
}
-(Atividade*)getSUBWithMetros:(int) metros{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Subida Moderada";
    ativ.detalheAtividade = @"Treino de subidas moderadas. Entre 85% e 95% da FCM";
    ativ.quantidade = [NSString stringWithFormat:@"%i m", metros];
    return ativ;
}
//[listAtividades addObject:@"Subida Moderada"];
//[listDetalheAtividades addObject:@"Treino de subidas moderadas. Entre 85% e 95% da FCM"];
-(Atividade*)getCorridaLeveWithMin:(int) minutos{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Corrida Leve";
    ativ.detalheAtividade = @"Corrida em ritmo confortável. Entre 65% e 75% da FCM";
    ativ.quantidade = [NSString stringWithFormat:@"%i min", minutos];
    return ativ;
}
-(Atividade*)getCorridaLeveWithHora:(int) hora{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Corrida Leve";
    ativ.detalheAtividade = @"Corrida em ritmo confortável. Entre 65% e 75% da FCM";
    ativ.quantidade = [NSString stringWithFormat:@"%i h", hora];
    return ativ;
}
-(Atividade*)getCaminhadaWithMin:(int) minutos{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Caminhada";
    ativ.detalheAtividade = @"Entre 50% e 65% da FCM";
    ativ.quantidade = [NSString stringWithFormat:@"%i min", minutos];
    return ativ;
}
-(Atividade*)getCaminhadaWithHora:(int) hora{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Caminhada";
    ativ.detalheAtividade = @"Entre 50% e 65% da FCM";
    ativ.quantidade = [NSString stringWithFormat:@"%i h", hora];
    return ativ;
}
-(Atividade*)getTroteRegenartivoWithMin:(int) minutos{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Trote Regenerativo";
    ativ.detalheAtividade = @"Corrida muito lenta, devagar quase parando. Entre 60% e 70% da FCM";
    ativ.quantidade = [NSString stringWithFormat:@"%i min", minutos];
    return ativ;
}
-(Atividade*)getCaminhadaLadeirasWithHora:(int) hora{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Caminhada com Ladeiras";
    ativ.detalheAtividade = @"Entre 50% e 65% da FCM em ambientes com subidas";
    ativ.quantidade = [NSString stringWithFormat:@"%i h", hora];
    return ativ;
}
-(Atividade*)getCaminhadaLadeirasWithMin:(int) minutos{
    Atividade *ativ = [[Atividade alloc]init];
    ativ.atividade = @"Caminhada com Ladeiras";
    ativ.detalheAtividade = @"Entre 50% e 65% da FCM em ambientes com subidas";
    ativ.quantidade = [NSString stringWithFormat:@"%i min", minutos];
    return ativ;
}
-(NSMutableArray*)list1{
    NSMutableArray *list = [[NSMutableArray alloc]init];
    NSMutableArray *listAtividades = nil;
    NSMutableArray *listDiaSemana = [[NSMutableArray alloc]init];
    //////////////1 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:30]];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:30]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:30]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////2 SEMANA
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    // DOMINGO
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:35]];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:35]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:40]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////3 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:40]];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:40]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getCaminhadaLadeirasWithMin:20]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    
    //////////////4 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getCaminhadaLadeirasWithMin:20]];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:50]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getCaminhadaLadeirasWithMin:20]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    
    //////////////5 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithHora:1]];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////6 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithHora:1]];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithHora:1]];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:2]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:3]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:3]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:3]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:3]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    //////////////7 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithHora:1]];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:3]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:3]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:3]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:3]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithHora:1]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:4]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:4]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:4]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:4]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    //////////////8 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithHora:1]];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:4]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:4]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:4]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:4]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:4]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:4]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaLadeirasWithHora:1]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////9 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaLadeirasWithHora:1]];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:5]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:5]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:5]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:5]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:5]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:5]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:5]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:5]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:5]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:5]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:5]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:5]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    //////////////10 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaLadeirasWithHora:1]];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:7]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:7]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:7]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:7]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:7]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:7]];
    [listAtividades addObject:[self getCaminhadaWithMin:3]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaLadeirasWithHora:1]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////11 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaLadeirasWithHora:1]];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:8]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:8]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:8]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:8]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:8]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:8]];
    [listAtividades addObject:[self getCaminhadaWithMin:2]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:10]];
    [listAtividades addObject:[self getCaminhadaWithMin:5]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:10]];
    [listAtividades addObject:[self getCaminhadaWithMin:5]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    
    //////////////12 SEMANA
    // DOMINGO
    listDiaSemana  = [[NSMutableArray alloc]init];
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SEGUNDA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //TERCA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:20]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:10]];
    [listAtividades addObject:[self getCaminhadaWithMin:5]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:10]];
    [listAtividades addObject:[self getCaminhadaWithMin:5]];
    [listDiaSemana addObject:listAtividades];
    //QUARTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //QUINTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:16]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:12]];
    [listAtividades addObject:[self getCaminhadaWithMin:5]];
    [listAtividades addObject:[self getTroteRegenartivoWithMin:12]];
    [listAtividades addObject:[self getCaminhadaWithMin:5]];
    [listDiaSemana addObject:listAtividades];
    //SEXTA
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getDiaDescanco]];
    [listDiaSemana addObject:listAtividades];
    //SABADO
    listAtividades = [[NSMutableArray alloc]init];
    [listAtividades addObject:[self getCaminhadaWithMin:30]];
    [listAtividades addObject:[self getCorridaLeveWithMin:15]];
    [listDiaSemana addObject:listAtividades];
    [list addObject:listDiaSemana];
    return list;
}
@end
