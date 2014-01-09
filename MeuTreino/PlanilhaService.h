//
//  TreinoService.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 27/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Planilha.h"
@interface PlanilhaService : NSObject{
     FMDatabase *database;
}

- (NSMutableArray*) listAll;

- (void)insert:(Planilha*)planilha;

- (void)update:(Planilha*)planilha;

- (void)remove:(NSInteger)key;

@end
