//
//  TreinoViewController.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 04/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Planilha.h"

@interface TreinoViewController : UINavigationController<UITableViewDataSource, UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


-(void)selectedPlanilha:(Planilha*)p;
-(void)reloadView:(id)sender;
@end
