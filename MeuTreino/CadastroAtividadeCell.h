//
//  AtividadeCell.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 30/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CadastroAtividadeCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSString *detalhe;
@end
