//
//  ListaDiasAtividadesViewController.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 08/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "ListaDiasTreinoViewController.h"
#import "DiasTreinoCell.h"
#import "DiaTreinoService.h"
#import "DiaTreino.h"
#import "DateUtil.h"
#import "ListaAtividadesDiaViewController.h"
#import "AtividadeDia.h"
#import "AtividadeDiaService.h"

@interface ListaDiasTreinoViewController (){
    NSMutableArray *listaDiaTreino;
    NSArray *listaSemana;
    DiaTreinoService *diaTreinoService;
    AtividadeDiaService *atividadeDiaService;
    int totalSemana;
    int diaSemanaInicio;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ListaDiasTreinoViewController

@synthesize idTreino;

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
    // Do any additional setup after loading the view from its nib.
    listaSemana = [NSArray arrayWithObjects:@"Domingo",@"Segunda",@"Terça",@"Quarta",@"Quinta",@"Sexta",@"Sábado", nil];
    diaTreinoService = [[DiaTreinoService alloc]init];
    atividadeDiaService = [[AtividadeDiaService alloc]init];
    listaDiaTreino = [diaTreinoService listByTreino:self.idTreino];
    double tot =[listaDiaTreino count] / 7.0f;
    double y = ceil(tot);
    totalSemana = (int)y;
    UIImageView *ivBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"] ];
    self.tableView.backgroundView = ivBackground;
    
    [self addButtonBack:self];
    [self setTitle:@"Dias de Treino"];

    UIImage* img = [UIImage imageNamed:@"top_bar"]  ;
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    UILabel *labelTitle= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180 , 40)];
    labelTitle.textAlignment = UITextAlignmentCenter;
    labelTitle.backgroundColor = [UIColor clearColor];
    
    [labelTitle setText:@"Dias de Treino"];
    
    [labelTitle setTextColor:[UIColor colorWithRed:72.0f/255.0f green:89.0f/255.0f blue:107.0f/255.0f alpha:1.0f]];
    [labelTitle setFont:[UIFont fontWithName:@"Museo900-Regular" size:24.0]];
    self.navigationItem.titleView = labelTitle;
    
    DiaTreino* obj = [listaDiaTreino objectAtIndex:0];
    
    diaSemanaInicio = [DateUtil weekFromDate:[NSDate dateWithTimeIntervalSince1970:obj.dia]];
    
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
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.delegate performSelector:@selector(reloadView:)withObject:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"DiasTreinoCell";
    
    DiasTreinoCell *cell = (DiasTreinoCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[DiasTreinoCell class]])
            {
                cell = (DiasTreinoCell *)currentObject;
                break;
            }
        }
    }
    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundView = img;
    
    //---set the text to display for the cell---
    
    int x = indexPath.section * 7;
    x = x + indexPath.row;
    if (diaSemanaInicio != 2) {
        int z = diaSemanaInicio;
        if (diaSemanaInicio == 1) {
            z = 8;
        }
        if (indexPath.section > 0) {
            int y = z - 2;
            x = x-y;
        }
    }
    DiaTreino* obj = [listaDiaTreino objectAtIndex:x]; 
    
   NSMutableArray *listAtividades = [atividadeDiaService listByTreino:idTreino andDia:obj.dia];
    NSString *textDetalhe = @""; 
    for (AtividadeDia *ativ in listAtividades) {
//        cell.labelDetalhe.textColor = [UIColor whiteColor];
         if (ativ.quantidade.length > 0 && [ativ.quantidade isEqualToString:@"(null)"]== NO) {
//        if([ativ.atividade isEqualToString:@"Dia de Descanso"]){
             textDetalhe = [textDetalhe stringByAppendingFormat:@"%@ : %@", ativ.atividade, ativ.quantidade];
        }else{
             textDetalhe = [textDetalhe stringByAppendingString:ativ.atividade];
        }
        if([listAtividades lastObject] != ativ){
            if([ativ.observacao rangeOfString:@"Opcional" options:NSCaseInsensitiveSearch].location == NSNotFound){
                textDetalhe = [textDetalhe stringByAppendingString:@" ou "];
            }else{
                textDetalhe = [textDetalhe stringByAppendingString:@" + "];
            }
            
        }
    }
    if (textDetalhe.length == 0) {
        textDetalhe =  @"Dia sem atividades, clique aqui para informar as atividades do dia.";
        cell.labelDetalhe.textColor = [UIColor grayColor];
    }
    cell.labelDetalhe.text= textDetalhe;
    
    
    
    NSString *cellValue = [DateUtil timeIntervalToString:obj.dia];
    //    cell.textLabel.backgroundColor =[UIColor clearColor];
//    cell.label.textColor = [UIColor whiteColor];
    int d=  [DateUtil weekFromDate:[NSDate dateWithTimeIntervalSince1970:obj.dia]];
    NSString *diaSemana = [listaSemana objectAtIndex:d-1];
    cell.label.text = [NSString stringWithFormat:@"%@ - %@", diaSemana,cellValue];
    
    
    //        cell.textLabel.frame = CGRectMake(300, 300, cell.textLabel.frame.size.width, cell.textLabel.frame.size.height);
    return cell;
}
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    NSString *title = [NSString stringWithFormat:@"%iª Semana", (section+1)];
//    return title;
//}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    int height = 25;
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, height)];
    
    UILabel* label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 2;
    label.frame = CGRectMake(20, 0, 250, height);
      NSString *title = [NSString stringWithFormat:@"%iª Semana", (section+1)];
       label.textColor = [UIColor whiteColor];
    [label setText:title];
    [label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:15]];
    [view addSubview:label];
    
    return view;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 30;
    }
    return 20;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        
        if (diaSemanaInicio == 1) {
            return 1;
        }
        return 9-diaSemanaInicio;
    }
    
    return 7;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return totalSemana;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListaAtividadesDiaViewController *vc = [[ListaAtividadesDiaViewController alloc]initWithNibName:@"ListaAtividadesDiaViewController" bundle:nil];
    vc.isHiddenButtonLike = self.isHiddenButtonLike;
    int x = indexPath.section * 7;
    x = x + indexPath.row;
    if (diaSemanaInicio != 2) {
        int z = diaSemanaInicio;
        if (diaSemanaInicio == 1) {
            z = 8;
        }
        if (indexPath.section > 0) {
            int y = z - 2;
            x = x-y;
        }
    }
    
    DiaTreino* obj = [listaDiaTreino objectAtIndex:x];
    [vc setIdTreino:self.idTreino];
    [vc setDia:obj.dia];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
