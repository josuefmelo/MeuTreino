//
//  SemanaService.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 29/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Semana.h"
@interface SemanaService : NSObject{
    FMDatabase *database;
}

- (void)insert:(Semana *)semana;
- (void)update:(Semana *)semana;
-(NSMutableArray*) listByPlanilha:(NSInteger) key;
-(void)remove:(NSInteger)idSemana;
@end
