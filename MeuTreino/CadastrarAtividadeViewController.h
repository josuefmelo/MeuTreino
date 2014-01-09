//
//  AtividadeViewController.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 30/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CadastrarAtividadeViewController : UITableViewController<UIPickerViewDataSource,UIPickerViewDelegate, UITextViewDelegate>


@property (nonatomic) NSInteger idPlanilha;
@property (nonatomic) NSInteger idSemana;
@property (nonatomic) NSInteger diaSemana;
@property (nonatomic) BOOL podeEditar;
@property (nonatomic, copy) NSString* diaTexto;

@property (strong, nonatomic) NSMutableArray *oneColumnList;

@property (strong, nonatomic) NSMutableArray *secondColumnList;

@property (strong, nonatomic) NSMutableArray *thirdColumnList;

@property (strong, nonatomic) NSMutableArray *fourColumnList;

@property (unsafe_unretained) id delegate;


- (void) dismissActionSheet:(id)sender;

-(void)selectAtividade:(NSString*)label andDetalhe :(NSString*)detalhe;
@end
