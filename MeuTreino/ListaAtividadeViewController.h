//
//  ListaAtividadeViewController.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 15/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaAtividadeViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (unsafe_unretained) id delegate;


@end
