//
//  ListaAtividadesDiaViewController.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 08/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "ListaAtividadesDiaViewController.h"
#import "AtividadeDiaService.h"
#import "AtividadeDiaCell.h"
#import "MyButton.h"
#import "AtividadeDia.h"


@interface ListaAtividadesDiaViewController (){
    AtividadeDiaService *atividadeDiaService;
    NSMutableArray *listAtividades;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListaAtividadesDiaViewController

@synthesize idTreino, dia;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    atividadeDiaService = [[AtividadeDiaService alloc] init];
    listAtividades = [atividadeDiaService listByTreino:self.idTreino andDia:self.dia];

    
    
    UIImageView *ivBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"] ];
    self.tableView.backgroundView = ivBackground;
    
    [self addButtonBack:self];
    [self setTitle:@"Atividades"];

    
    UIImage* img = [UIImage imageNamed:@"top_bar"]  ;
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    UILabel *labelTitle= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180 , 40)];
    labelTitle.textAlignment = UITextAlignmentCenter;
    labelTitle.backgroundColor = [UIColor clearColor];
    
    [labelTitle setText:@"Atividades"];
    
    [labelTitle setTextColor:[UIColor colorWithRed:72.0f/255.0f green:89.0f/255.0f blue:107.0f/255.0f alpha:1.0f]];
    [labelTitle setFont:[UIFont fontWithName:@"Museo900-Regular" size:24.0]];
    self.navigationItem.titleView = labelTitle;

}
-(void) addButtonBack:(UIViewController*)vc{
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [bt setFrame:CGRectMake(0, 0, 60, 30)];
    [bt setTitle:@" Voltar" forState:UIControlStateNormal];
    [bt setBackgroundImage:[UIImage imageNamed:@"button_back"] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[bt titleLabel] setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];
    
    UIBarButtonItem *button=[[UIBarButtonItem alloc] initWithCustomView:bt];
    vc.navigationItem.leftBarButtonItem=button;
}
-(void) back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"AtividadeDiaCell";
    
    AtividadeDiaCell *cell = (AtividadeDiaCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[AtividadeDiaCell class]])
            {
                cell = (AtividadeDiaCell *)currentObject;
                break;
            }
        }
    }
    cell.labelDetalhe.frame = CGRectMake(cell.labelDetalhe.frame.origin.x, cell.labelDetalhe.frame.origin.y, 240, cell.labelDetalhe.frame.size.height);
    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundView = img;
    
    int row = (indexPath.section*7) + indexPath.row;
    
    AtividadeDia* at = [listAtividades objectAtIndex:row];
    
//    NSString *cellValue =nil;
//    if ([obj.atividade isEqualToString:@"Dia de Descanso"]) {
//        cellValue = obj.atividade;
//    }else{
//        cellValue = [NSString stringWithFormat:@"%@ : %@",obj.atividade, obj.quantidade];
//    }
//    cell.label.textColor = [UIColor whiteColor];
//    
//    cell.label.text = cellValue;
//    cell.labelDetalhe.text = obj.detalheAtividade;
    
    
//    cell.label.textColor = [UIColor whiteColor];
    cell.label.backgroundColor = [UIColor clearColor];
    if (at.quantidade.length > 0 && [at.quantidade isEqualToString:@"(null)"]== NO) {
        cell.label.text = [NSString stringWithFormat:@"%@ : %@",at.atividade, at.quantidade];
    }else{
        cell.label.text = at.atividade;
    }
    cell.labelDetalhe.text = at.detalheAtividade;
    cell.labelObs.text = @"";
    if (at.observacao.length > 0 && [at.observacao isEqualToString:@"(null)"]== NO) {
        cell.labelObs.text = [NSString stringWithFormat:@"*%@",at.observacao];
    }
    
    
    cell.rowIndex = indexPath.row;
    if (self.isHiddenButtonLike == NO) {
        [self addButtonLike:cell andChecked:at.feito];
    }
    
    
    return cell;
}

-(void) addButtonLike:(AtividadeDiaCell*) cell andChecked:(BOOL)isChecked {
    MyButton *bt = [[MyButton alloc]init];
    
    bt.rowIndex = cell.rowIndex;
    bt.frame = CGRectMake(265.0f, 22.0f, 46.0f, 47.0f);
    if (isChecked) {
        [bt checked];
        [bt setImage:[UIImage imageNamed:@"button_checked"] forState:UIControlStateNormal];
        
    }else{
        [bt unchecked];
        [bt setImage:[UIImage imageNamed:@"button_unchecked"] forState:UIControlStateNormal];
        
    }
    [bt addTarget:self action:@selector(buttonPressedLike:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:bt];
}

-(void) buttonPressedLike:(id)sender{
    MyButton *bt = (MyButton *)sender;
    AtividadeDia *at =[listAtividades objectAtIndex:bt.rowIndex];
    if(!bt.isChecked){
        [bt setImage:[UIImage imageNamed:@"button_checked"] forState:UIControlStateNormal];
        at.feito  = 1;
        
    }else{
        [bt setImage:[UIImage imageNamed:@"button_unchecked"] forState:UIControlStateNormal];
        at.feito  = 0;
    }
    
    
    bt.isChecked = !bt.isChecked;
    
    [atividadeDiaService updateFeito:at];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return [listAtividades count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
