//
//  DiaTreinoService.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 06/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiaTreino.h"

@interface DiaTreinoService : NSObject{
    FMDatabase *database;
}
- (void)insert:(DiaTreino *)obj;
- (NSMutableArray*) listByTreino:(NSInteger)idTreino;
- (void)remove:(int)key;
@end
