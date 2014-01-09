//
//  TreinoService.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 06/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Treino.h"

@interface TreinoService : NSObject{
    FMDatabase *database;
}
- (void)insert:(Treino *)obj;
- (Treino*) get;
- (void)finalizar:(Treino *)obj;
- (NSMutableArray*) listAll;
- (void)remove:(int)key;
- (NSMutableArray*) listAllRealizadas;
@end
