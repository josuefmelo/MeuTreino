//
//  CadastrarTreinoViewController.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 28/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Planilha.h"
#import "PlanilhaService.h"
@interface CadastrarPlanilhaViewController : UITableViewController<UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) Planilha* planilha;
@property (nonatomic, strong) PlanilhaService* planilhaService;
@property (nonatomic) BOOL isNew;

@property (unsafe_unretained) id delegate;

-(void)updateTextView;

@end
