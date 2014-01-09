//
//  AtletaViewController.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 02/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AtletaViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource, UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UINavigationItem *navTitle;

@property (strong, nonatomic) NSMutableArray *oneColumnList;

@property (strong, nonatomic) NSMutableArray *secondColumnList;

@end
