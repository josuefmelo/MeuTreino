//
//  AtletaService.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 02/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Atleta.h"
@interface AtletaService : NSObject{
    FMDatabase *database;
}
- (Atleta*) get;
- (void) update:(Atleta *)at;
@end
