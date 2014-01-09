//
//  AtividadeDiaCell.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 08/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AtividadeDiaCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UILabel *labelDetalhe;
@property (strong, nonatomic) IBOutlet UILabel *labelObs;
@property (nonatomic) int rowIndex;

@end
