//
//  ListaTreinosViewController.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 25/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaPlanilhasViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (unsafe_unretained) id delegate;

-(void)reloadData;

@end
