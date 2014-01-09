//
//  ListaDiasAtividadesViewController.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 08/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaDiasTreinoViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) NSInteger idTreino;
@property (unsafe_unretained) id delegate;
@property (nonatomic) BOOL isHiddenButtonLike;
@end
