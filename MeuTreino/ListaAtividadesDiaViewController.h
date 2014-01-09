//
//  ListaAtividadesDiaViewController.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 08/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaAtividadesDiaViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) BOOL isHiddenButtonLike;

@property (nonatomic) NSInteger idTreino;

@property (nonatomic) long dia;

@end
