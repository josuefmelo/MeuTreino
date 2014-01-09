//
//  TreinoViewController.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 04/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "TreinoViewController.h"
#import "PlanilhaCell.h"
#import "ListaPlanilhasViewController.h"
#import "AtletaViewController.h"
#import "Treino.h"
#import "DateUtil.h"
#import "SemanaService.h"
#import "Semana.h"
#import "Atividade.h"
#import "AtividadeService.h"
#import "TreinoService.h"
#import "DiaTreino.h"
#import "DiaTreinoService.h"
#import "AtividadeDia.h"
#import "AtividadeDiaService.h"
#import "ListaDiasTreinoViewController.h"
#import "AtividadeDiaCell.h"
#import "MyButton.h"
#import "ComecarAtividadesViewController.h"
@interface TreinoViewController (){
    BOOL treinoIniciado;
    Treino* treino;
    TreinoService *treinoService;
    AtividadeDiaService *atividadeDiaService;
    NSMutableArray *listAtividadesDia;
    UIActionSheet* pickerAction;
    UIDatePicker* datePicker;
    UIToolbar* toolbarPicker;
    NSString *dataHoje;
    UIAlertView *loading;
    BOOL semAtividade;
}

@property (strong, nonatomic) UITableViewController* tvController;

@end

@implementation TreinoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _tvController = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        
        self.tableView = _tvController.tableView;
        _tvController.tableView = self.tableView;
        self.tableView.delegate = self;
        
        self.tableView.dataSource = self;
        
        [self setViewControllers:[NSArray arrayWithObject:_tvController]];
        
    }
    return self;
}

-(void) addButtonFinalizar:(UIViewController*)vc{
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [bt setFrame:CGRectMake(0, 0, 60, 30)];
    [bt setTitle:@"Finalizar" forState:UIControlStateNormal];
    [bt setBackgroundImage:[UIImage imageNamed:@"button_grade"] forState:UIControlStateNormal];
    
    [bt addTarget:self action:@selector(buttonPressedFinalizar:) forControlEvents:UIControlEventTouchUpInside];
    
    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[bt titleLabel] setFont:[UIFont fontWithName:@"Arial-BoldMT" size:13]];
    
    UIBarButtonItem *button=[[UIBarButtonItem alloc] initWithCustomView:bt];
    vc.navigationItem.rightBarButtonItem=button;
}

- (void)buttonPressedFinalizar:(id)sender{
    semAtividade = NO;
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Finalizar Treino"
                                                        message:@"Deseja realmente finalizar o treino?"
                                                       delegate:self
                                              cancelButtonTitle:@"Não"
                                              otherButtonTitles:@"Sim",nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *titleButton = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([titleButton isEqualToString:@"Sim"]) {
        treino.dataFim = [[NSDate date] timeIntervalSince1970];
        [treinoService finalizar:treino];
        treino = [treinoService get];
        
        if (treino.key > 0) {
            atividadeDiaService = [[AtividadeDiaService alloc] init];
            dataHoje = [DateUtil dateToString:[NSDate date]];
            long dt = [[DateUtil stringToDate:dataHoje] timeIntervalSince1970];
            listAtividadesDia = [atividadeDiaService listByTreino:treino.key andDia:dt];
        }
        _tvController.navigationItem.rightBarButtonItem = nil;
        [self reloadView:nil];
        [self.tableView reloadData];
    }
}


-(void)reloadView:(id)sender{
    [self loadTopBar];
    if (treino.key > 0) {
        atividadeDiaService = [[AtividadeDiaService alloc] init];
        dataHoje = [DateUtil dateToString:[NSDate date]];
        long dt = [[DateUtil stringToDate:dataHoje] timeIntervalSince1970];
        listAtividadesDia = [atividadeDiaService listByTreino:treino.key andDia:dt];
        [self.tableView reloadData];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    treinoService= [[TreinoService alloc]init];
    
    semAtividade = NO;
    
    treino = [treinoService get];
    
    if (treino.key > 0) {
        atividadeDiaService = [[AtividadeDiaService alloc] init];
        dataHoje = [DateUtil dateToString:[NSDate date]];
        long dt = [[DateUtil stringToDate:dataHoje] timeIntervalSince1970];
        listAtividadesDia = [atividadeDiaService listByTreino:treino.key andDia:dt];
        
        for (AtividadeDia *at in listAtividadesDia) {
            if ([at.atividade isEqualToString:@"Dia de Descanso"] ||
                [at.atividade isEqualToString:@"Dia de Prova"] ||
                [at.atividade isEqualToString:@"Cross-training"]) {
                semAtividade = YES;
                break;
            }
        }
    }
    UIImageView *ivBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"] ];
    self.tableView.backgroundView = ivBackground;
    [self loadTopBar];
    if (treino.key != 0) {
        [self addButtonFinalizar:_tvController];
    }
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadView:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

-(void)loadTopBar{
    [_tvController setTitle: @"Meu Treino"];
    [_tvController.navigationController.navigationBar.topItem setTitle: @"Meu Treino"];
    UIImage* img = [UIImage imageNamed:@"top_bar"]  ;
    [_tvController.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    UILabel *labelTitle= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180 , 40)];
    labelTitle.textAlignment = UITextAlignmentCenter;
    labelTitle.backgroundColor = [UIColor clearColor];
    [labelTitle setTextColor:[UIColor colorWithRed:72.0f/255.0f green:89.0f/255.0f blue:107.0f/255.0f alpha:1.0f]];
    [labelTitle setText:@"Meu Treino"];
    [labelTitle setFont:[UIFont fontWithName:@"Museo900-Regular" size:24.0]];
    UINavigationItem  *navTitle = _tvController.navigationController.navigationBar.topItem;
    navTitle.titleView = labelTitle;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setNavBar:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (treino.key == 0) {
        return 1;
    }else{
        if (section == 0) {
            return 1;
        }
        return [listAtividadesDia count];
    }
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
    AtividadeDia *at =[listAtividadesDia objectAtIndex:bt.rowIndex];
    if(!bt.isChecked){
        [bt setImage:[UIImage imageNamed:@"button_checked"] forState:UIControlStateNormal];
        at.feito=1;
    }else{
        [bt setImage:[UIImage imageNamed:@"button_unchecked"] forState:UIControlStateNormal];
        at.feito = 0;
    }
    bt.isChecked = !bt.isChecked;
    [atividadeDiaService updateFeito:at];

}
-(UITableViewCell *) getAtividadeCell:(NSIndexPath *)indexPath{
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
    
    AtividadeDia *at = [listAtividadesDia objectAtIndex:indexPath.row];
//    cell.label.textColor = [UIColor whiteColor];
    cell.label.backgroundColor = [UIColor clearColor];
    if (at.quantidade.length > 0 && [at.quantidade isEqualToString:@"(null)"]== NO) {
//    if ([at.atividade isEqualToString:@"Dia de Descanso"]) {
        cell.label.text = [NSString stringWithFormat:@"%@ : %@",at.atividade, at.quantidade];
        
    }else{
        cell.label.text = at.atividade;
    }
    cell.labelDetalhe.text = at.detalheAtividade;
    if (at.observacao.length > 0 && [at.observacao isEqualToString:@"(null)"]== NO) {
        cell.labelObs.text = [NSString stringWithFormat:@"*%@",at.observacao];
    }
    cell.backgroundView = img;
    cell.rowIndex = indexPath.row;
    [self addButtonLike:cell andChecked:at.feito];
    return cell;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (treino.key != 0 && indexPath.section == 1) {
        return [self getAtividadeCell:indexPath];
    }
    static NSString *CellIdentifier = @"PlanilhaCell";
    
    PlanilhaCell *cell = (PlanilhaCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[PlanilhaCell class]])
            {
                cell = (PlanilhaCell *)currentObject;
                break;
            }
        }
    }
    UIImageView* img = nil;
//    if (treino.key !=0  && indexPath.section == 1 ) {
//        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round_space"]];
//    }else{
        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
//    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundView = img;
    

    NSString *cellValue = nil;
//    cell.label.textColor = [UIColor whiteColor];
    if (treino.key == 0) {
        if (indexPath.section == 0) {
            cellValue =@"Selecione aqui a planilha para o seu treino";
        }else{
            cellValue =@"Selecione aqui a data de início do seu treino";
        }
        cell.label.enabled = NO;
    }else{
//        if (indexPath.section == 0) {
            cellValue = treino.planilha;
//        }else{
//            AtividadeDia *atv = [listAtividadesDia objectAtIndex:indexPath.row];
//            
//            cell.textLabel.backgroundColor = [UIColor clearColor];
//            if ([atv.atividade isEqualToString:@"Dia de Descanso"]) {
//                cellValue = atv.atividade;
//            }else{
//                cellValue= [NSString stringWithFormat:@"%@ : %@",atv.atividade, atv.quantidade];
//            }
//            cell.accessoryType = UITableViewCellAccessoryNone;
//        }
//        
//       
//
    }
    cell.label.text = cellValue;

    return cell;
    
}

-(void)selectedPlanilha:(Planilha *)p{
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    PlanilhaCell* cell = (PlanilhaCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    cell.label.text = p.objetivo;
    cell.label.enabled = YES;
    treino.planilha = p.objetivo;
    treino.idPlanilha = p.key;
//    [_tvController.navigationController.navigationBar.topItem setTitle: @"Meu Treino"];
    [self loadTopBar];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (treino.key !=0  && indexPath.section == 1 ) {
        return 90;
    }
    return 65;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (semAtividade) {
        return 0;
    }
    if (treino.key !=0 && section == 0) {
        return 100.0f;
    }
    return 60.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (section != 0 || semAtividade) {
        return nil;
    }
    if (treino.key == 0) {
        return [self viewIniciarTreino];
    }else {
        if ([listAtividadesDia count] > 0 ) {
            return [self viewComecarAtividadeDia];
        }
    }
    
    return  nil;
}
-(UIView *)viewComecarAtividadeDia{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 60)];
    
    UIButton* bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(20, 16, 280, 60);
    [bt setTitle:@"Começar" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[bt titleLabel] setFont:[UIFont fontWithName:@"Arial-BoldMT" size:28]];
    [bt setBackgroundImage:[UIImage imageNamed:@"button_start"] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(pressedBtComecarAtividadeDIA:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:bt];
    return view;
}
- (void) pressedBtComecarAtividadeDIA:(id)sender{
    ComecarAtividadesViewController *vc = [[ComecarAtividadesViewController alloc]initWithNibName:@"ComecarAtividadesViewController" bundle:nil];
    vc.delegate = self;
    [vc setAtividadeDiaService:atividadeDiaService];
    [vc setListaAtividadesDia:listAtividadesDia];
    
    [self pushViewController:vc animated:YES];
}

-(UIView *)viewIniciarTreino{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 60)];
    
    UILabel* label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 2;
    label.frame = CGRectMake(40, 0, 200, 60);
    label.text = @"Informe o objetivo e data de início para iniciar seu treino.";
    label.textColor = [UIColor whiteColor];
    [label setFont:[UIFont fontWithName:@"Arial" size:14]];
    [view addSubview:label];
    
    UIButton* bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(240, 16, 60, 30);
    [bt setTitle:@"Iniciar" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[bt titleLabel] setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];
    [bt setBackgroundImage:[UIImage imageNamed:@"button_grade"] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(pressedBtIniciar:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:bt];
    return view;
}

- (void) pressedBtIniciar:(id)sender{
    NSString *msgValidar = nil;
    if (treino.planilha.length == 0 || treino.dataInicio <= 0) {
        msgValidar = @"É obrigatório informar o objetivo e data de início.";
    }
    if (msgValidar.length > 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Campos Obrigatórios"
                                                        message:msgValidar
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil,nil];
        [alertView show];
        return;
    }
    
    loading = [[UIAlertView alloc] initWithTitle:@"Iniciando treino, aguarde..."
                                                  message:@"\n"
                                                 delegate:self
                                        cancelButtonTitle:nil
                                        otherButtonTitles:nil];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(139.5, 75.5); // .5 so it doesn't blur
    [loading addSubview:spinner];
    [spinner startAnimating];
    [loading show];
    [self performSelector:@selector(iniciar) withObject:self afterDelay:2];

}
-(void) iniciar{
    SemanaService *semanaService = [[SemanaService alloc]init];
    NSMutableArray *listSemana = [semanaService listByPlanilha:treino.idPlanilha];
    AtividadeService *ativService = [[AtividadeService alloc]init];
    
    [treinoService insert:treino];
    
    DiaTreinoService *diaTreinoService = [[DiaTreinoService alloc]init];
    if (atividadeDiaService == nil) {
        atividadeDiaService = [[AtividadeDiaService alloc]init];
    }
    
    DiaTreino *diaTreino = [[DiaTreino alloc]init];
    AtividadeDia *atividadeDia = [[AtividadeDia alloc]init];
    NSDate *dia =[NSDate dateWithTimeIntervalSince1970: treino.dataInicio];
    int diaSemana = [DateUtil weekFromDate:dia];
    
    for (Semana *sem in listSemana) {
        for (int i =2; i < 9; i++) {
            if (sem.semana == 1 ) {
                if (diaSemana == 1) {
                    i = 8;
                }
                if (i < diaSemana &&  diaSemana != 2) {
                    continue;
                }
            }
            int index = i;
            if (i == 8) {
                index = 1;
            }
            diaTreino.key = 0;
            diaTreino.idTreino = treino.key;
            diaTreino.dia = [dia timeIntervalSince1970];
            [diaTreinoService insert:diaTreino];
            NSMutableArray *listAtiv = [ativService listBySemana:sem.key andDiaSemana:index];
            for (Atividade *ativ in listAtiv) {
                atividadeDia.key=0;
                atividadeDia.idDiaTreino = diaTreino.key;
                atividadeDia.idAtividade = ativ.key;
                atividadeDia.atividade = ativ.atividade;
                atividadeDia.quantidade = ativ.quantidade;
                atividadeDia.detalheAtividade = ativ.detalheAtividade;
                atividadeDia.observacao = ativ.observacao;
                [atividadeDiaService insert:atividadeDia];
            }
            dia = [dia dateByAddingTimeInterval:60*60*24*1];
        }
    }
    
    [self viewDidLoad];
    [self.tableView reloadData];
    [loading dismissWithClickedButtonIndex:0 animated:YES];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    int height = 25;
    
    
    
    UILabel* label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 2;
    
    switch (section) {
        case 0:
            label.text = @"Objetivo";
            break;
        case 1:
            if (treino.key == 0) {
                 label.text = @"Data Início";
            }else{
                height = 16;
                label.text =[NSString stringWithFormat:@"Atividades de hoje(%@)", dataHoje];;
            }
            break;
        case 2:
            label.text = @"Atividades do dia";
            break;
        default:
            break;
    }
    label.frame = CGRectMake(20, 0, 250, height);
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, height)];
    label.textColor = [UIColor whiteColor];
    [label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:15]];
    [view addSubview:label];
    
    return view;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
//        if (indexPath.row == 0) {
        if (treino.key !=0) {
            ListaDiasTreinoViewController *vc = [[ListaDiasTreinoViewController alloc]initWithNibName:@"ListaDiasTreinoViewController" bundle:nil];
            [vc setIdTreino:treino.key];
            
            vc.delegate = self;
            
            [self pushViewController:vc animated:YES];
        }else{
            ListaPlanilhasViewController* vc = [[ListaPlanilhasViewController  alloc]initWithNibName:@"ListaPlanilhasViewController" bundle:nil];
            vc.delegate = self;
            [self pushViewController:vc animated:YES];
        }
//        }
    }
    if (indexPath.section == 1 && treino.key ==0) {
        [self ChooseDP];
    }
    
}
#pragma mark -  PickerView
//returns number of components in pickerview
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}


//returns number of rows in date picker
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return 0;
}
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    if (component == 0) {
//        return [oneColumnList objectAtIndex:row];
//    }
//    return [secondColumnList objectAtIndex:row];
//}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 90;
}

-(void)ChooseDP{
    pickerAction = [[UIActionSheet alloc] initWithTitle:@"Date"
                                               delegate:nil
                                      cancelButtonTitle:nil
                                 destructiveButtonTitle:nil
                                      otherButtonTitles:nil];
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake ( 0.0, 44.0, 0.0, 0.0)];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    //format datePicker mode. in this example time is used
    datePicker.datePickerMode =UIDatePickerModeDate;;
//    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
//    PlanilhaCell* cell = (PlanilhaCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    
    if (treino.dataInicio > 0) {
        [datePicker setDate:[NSDate dateWithTimeIntervalSince1970:treino.dataInicio]];
    }
    
    //calls dateChanged when value of picker is changed
    toolbarPicker = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbarPicker.barStyle=UIBarStyleBlackOpaque;
    [toolbarPicker sizeToFit];
    NSMutableArray *itemsBar = [[NSMutableArray alloc] init];
    //calls DoneClicked
    UIBarButtonItem *bbitem = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:self action:@selector(DoneClicked)];
    [itemsBar addObject:bbitem];
    [toolbarPicker setItems:itemsBar animated:YES];
    [pickerAction addSubview:toolbarPicker];
    [pickerAction addSubview:datePicker];
    [pickerAction showInView:self.view];
    [pickerAction setBounds:CGRectMake(0,0,320, 464)];
}
-(BOOL)closeDatePicker:(id)sender{
    [pickerAction dismissWithClickedButtonIndex:0 animated:YES];
//    [textFieldPicker resignFirstResponder];
    
    return YES;
}

//action when done button is clicked
-(IBAction)DoneClicked{
    [self dateChanged];
    
    [self closeDatePicker:self];
    datePicker.frame=CGRectMake(0, 44, 320, 416);
    
}
-(IBAction)dateChanged{
    //format date
    NSDateFormatter *FormatDate = [[NSDateFormatter alloc] init];
    
    //set date format
    [FormatDate setDateFormat:@"dd/MM/YYYY"];
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    PlanilhaCell* cell = (PlanilhaCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    cell.label.text =  [FormatDate stringFromDate:[datePicker date]];
    cell.label.enabled = YES;
    treino.dataInicio =[[DateUtil stringToDate:[DateUtil dateToString:[datePicker date]]]timeIntervalSince1970];
}
@end
