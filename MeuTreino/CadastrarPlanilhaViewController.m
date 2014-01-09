//
//  CadastrarTreinoViewController.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 28/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "CadastrarPlanilhaViewController.h"
#import "SemanaCell.h"
#import "SemanaService.h"
#import "Semana.h"
#import "ListaDiasSemanaViewController.h"
#import "AtividadeService.h"


@interface CadastrarPlanilhaViewController (){
    
    IBOutlet UITableViewCell *tbCellObjetivo;
//    IBOutlet UITextField *textObjetivo;
    IBOutlet UITextField *textViewObjetivo;
    
    NSMutableArray* listSemana;
    SemanaService* semanaService;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation CadastrarPlanilhaViewController

@synthesize planilha;
@synthesize planilhaService;
@synthesize tableView = _tableView;
@synthesize delegate;
@synthesize isNew;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    UIImageView *ivBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"] ];
    self.tableView.backgroundView = ivBackground;
    
   
    
    [self setTitle:@"Planilha"];
    
    UIImage* img = [UIImage imageNamed:@"top_bar"]  ;
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    UILabel *labelTitle= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180 , 40)];
    labelTitle.textAlignment = UITextAlignmentCenter;
    labelTitle.backgroundColor = [UIColor clearColor];
    [labelTitle setTextColor:[UIColor colorWithRed:72.0f/255.0f green:89.0f/255.0f blue:107.0f/255.0f alpha:1.0f]];
    [labelTitle setText:@"Planilha"];
    [labelTitle setFont:[UIFont fontWithName:@"Museo900-Regular" size:24.0]];
    self.navigationItem.titleView = labelTitle;
    
    semanaService = [[SemanaService alloc]init];
    listSemana = [semanaService listByPlanilha:planilha.key];
    int total = [listSemana count];
    if ( total == 0) {
        [self addNewSemanaArray];
    }
    @try {
        [textViewObjetivo removeObserver:self forKeyPath:@"contentSize"];
        
    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
    [textViewObjetivo addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];
    [self addButtonBack:self];
    if (planilha.podeEditar) {
        [self addButtonSave:self];
    }
    [super viewDidLoad];
   
    
}
-(void)dealloc{
    [textViewObjetivo removeObserver:self forKeyPath:@"contentSize" ];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    UITextView *tv = object;
    CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale])/2.0;
    topCorrect = ( topCorrect < 0.0 ? 0.0 : topCorrect );
    tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
}

- (void)buttonPressedSalvar:(id)sender
{
   
    NSString* valueCell = textViewObjetivo.text;
    if (valueCell.length == 0 ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Campos Obrigatórios"
                                                            message:@"É obrigatório informar o objetivo da planilha de treino."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil,nil];
        [alertView show];
        return;
    }
    
    
    AtividadeService *atividadeService = [[AtividadeService alloc]init];
    BOOL temDiaSemanaSemAtiv = NO;
    NSMutableArray *listAt = nil;
    for (Semana *sem in listSemana) {
        for (int i=1; i<8; i++) {
            listAt = [atividadeService listBySemana:sem.key andDiaSemana:i];
            if ([listAt count] == 0) {
                temDiaSemanaSemAtiv = YES;
                goto outer;
            }
        }
        
    }
    outer:;
    if (temDiaSemanaSemAtiv) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Dia sem Atividades"
                                                            message:@"Existe(m) dia(s) da semana sem atividades. Deseja que esses dias seja(m) dia(s) de descanso?"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancelar"
                                                  otherButtonTitles:@"Sim",nil];
         [alertView show];
        return;
    }

    
    [self salvar];
}

-(void)salvar{
    NSString* valueCell = textViewObjetivo.text;
    planilha.objetivo = valueCell;
    
    [planilhaService update:planilha];
    [self back];
}

-(void) showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg andDelegate:(id)d{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:d
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil,nil];
    [alertView show];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Semana* semana = [listSemana objectAtIndex:indexPath.row];
    
    AtividadeService *atividadeService = [[AtividadeService alloc]init];
    
    [atividadeService removeBySemana:semana.key];
    [semanaService remove:semana.key];
    
    [listSemana removeObjectAtIndex:indexPath.row];
    
    for (int i= 0; i < [listSemana count]; i++) {
        semana = [listSemana objectAtIndex:i];
        semana.semana = i+1;
        [semanaService update:semana];
    }
    
    
    [self.tableView reloadData];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && planilha.podeEditar) {
        return YES;
    }
    return NO;
}

-(void) addNewSemanaArray{
    int total = [listSemana count];
    Semana* s = [[Semana alloc]init];
    total++;
    s.semana = total;
    s.idPlanilha = planilha.key;

    [semanaService insert:s];
    [listSemana addObject:s];
    
}

- (void)alertOKCancelAction:(id)sender {
    if (isNew == YES) {
        // open a alert with an OK and cancel button
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Deseja sair sem salvar o treino?" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"OK", nil];
        [alert show];
        return;
    }
    [self back];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons
//    if (isNew == NO) {
//        [self back];
//        return;
//    }
    NSString *titleButton = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([titleButton isEqualToString:@"Sim"]) {
        AtividadeService *atividadeService = [[AtividadeService alloc]init];
        Atividade *ativ = [[Atividade alloc]init];
        NSMutableArray *listAt = nil;
        for (Semana *sem in listSemana) {
            for (int i=1; i<8; i++) {
                listAt = [atividadeService listBySemana:sem.key andDiaSemana:i];
                if ([listAt count] == 0) {
                    ativ.key = 0;
                    ativ.atividade = @"Dia de Descanso";
                    ativ.detalheAtividade = @"Quando você descansa é que melhora seu desempenho, o corpo se recupera e promove melhorias no organismo";
                    ativ.diaSemana = i;
                    ativ.idSemana = sem.key;
                    [atividadeService insert:ativ];
                }
            }
        }
        [self salvar];
        return;
    }
    if (buttonIndex == 1)
    {
        AtividadeService* atividadeService = [[AtividadeService alloc]init];
        for (Semana* semana in listSemana) {
            [atividadeService removeBySemana:semana.key];
            [semanaService remove:semana.key];
        }
        [planilhaService remove:planilha.key];
        [self back];
    }
    
    
    
    
}

-(void) back{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.delegate performSelector:@selector(reloadData) withObject:nil];
}

-(void) addButtonBack:(UIViewController*)vc{
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [bt setFrame:CGRectMake(0, 0, 60, 30)];
    [bt setTitle:@" Voltar" forState:UIControlStateNormal];
    [bt setBackgroundImage:[UIImage imageNamed:@"button_back"] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(alertOKCancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];    
    [[bt titleLabel] setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];
    
    UIBarButtonItem *button=[[UIBarButtonItem alloc] initWithCustomView:bt];
    vc.navigationItem.leftBarButtonItem=button;
}
-(void) addButtonSave:(UIViewController*)vc{
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [bt setFrame:CGRectMake(0, 0, 60, 30)];
    [bt setTitle:@"Salvar" forState:UIControlStateNormal];
    [bt setBackgroundImage:[UIImage imageNamed:@"button_grade"] forState:UIControlStateNormal];
    
    [bt addTarget:self action:@selector(buttonPressedSalvar:) forControlEvents:UIControlEventTouchUpInside];
    
    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[bt titleLabel] setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];
    
    UIBarButtonItem *button=[[UIBarButtonItem alloc] initWithCustomView:bt];
    vc.navigationItem.rightBarButtonItem=button;
}
- (IBAction)pressedBtAdd:(id)sender{
    
    [self addNewSemanaArray];
//    [_tableView reloadData];
    Semana* sem = [listSemana lastObject];
    [self showListaDiasSemanaViewController:sem];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    tbCellObjetivo = nil;
    _tableView = nil;
    planilha = nil;
    [self setTableView:nil];
    textViewObjetivo = nil;
    textViewObjetivo = nil;
    [super viewDidUnload];
}

#pragma mark - tableview
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        if (planilha.podeEditar == NO) {
            return 30;
        }

    }
    return 50.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    int height = 70;
    if (planilha.podeEditar == NO && section == 1) {
        height = 30;
    }
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, height)];
    
    UILabel* label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 2;
    if (section == 1) {
        label.frame = CGRectMake(20, 0, 250, height);
        if(planilha.podeEditar){
            label.text = @"Informe qual é o objetivo, e depois adicione as semanas do seu treino.";

        }else{
            label.text = @"Semanas";
        }
       

    }else{
        label.frame = CGRectMake(20, 0, 270, height);
        label.text = @"*Importante: Nunca faça exercícios físicos sem a orientação de um profissional.";
    }
    label.textColor = [UIColor whiteColor];
    if(planilha.podeEditar == NO && section == 1 ) {
        [label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:15]];
        
    }else{
        [label setFont:[UIFont fontWithName:@"Arial" size:14]];
    }
    [view addSubview:label];
    if (planilha.podeEditar && section == 1) {
        UIButton* btAdd = [UIButton buttonWithType:UIButtonTypeCustom];
        btAdd.frame = CGRectMake(250, 10, 53, 30);
        [btAdd setImage:[UIImage imageNamed:@"button_add"]forState:UIControlStateNormal];
        [btAdd addTarget:self action:@selector(pressedBtAdd:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btAdd];
    }
    
    
    return view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return [listSemana count];
}


-(UITableViewCell *) getCellObjetivo{
    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
    
    tbCellObjetivo.backgroundView = img;
    textViewObjetivo.delegate = self;
    
    return tbCellObjetivo;
    
    
}
-(void)updateTextView{
    [textViewObjetivo resignFirstResponder];
    [_tableView reloadData];
}

-(UITableViewCell *) getCellTbSemana:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"SemanaCell";
    SemanaCell *cell = (SemanaCell*)[_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[SemanaCell class]])
            {
                cell = (SemanaCell *)currentObject;
                break;
            }
        }
    }
    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundView = img;
    
    //---set the text to display for the cell---
    Semana* obj = [listSemana objectAtIndex:indexPath.row];
    NSString *cellValue = [NSString stringWithFormat:@"%iª SEMANA", obj.semana];
        
    cell.label.text = cellValue;
    return cell;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [self getCellObjetivo];
        if (planilha.objetivo.length>0) {
            textViewObjetivo.backgroundColor = [UIColor clearColor];
            textViewObjetivo.text = planilha.objetivo;
        }
        textViewObjetivo.enabled = planilha.podeEditar;
        return cell;
    }
    return [self getCellTbSemana:indexPath];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

#pragma mark - Table view delegate

- (void) showListaDiasSemanaViewController:(Semana*)sem{
    ListaDiasSemanaViewController *diasSemanaViewController = [[ListaDiasSemanaViewController alloc] initWithNibName:@"ListaDiasSemanaViewController" bundle:nil];
    diasSemanaViewController.delegate = self;
    [diasSemanaViewController setPodeEditar:planilha.podeEditar];
    [diasSemanaViewController setIdSemana:sem.key];
    [diasSemanaViewController setIdPlanilha:sem.idPlanilha];
    [diasSemanaViewController setSemana:sem.semana];
    // ...
    // Pass the selected object to the new view controller.
    [textViewObjetivo becomeFirstResponder];
    [self.navigationController pushViewController:diasSemanaViewController animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    if (indexPath.section == 0) {
        return;
    }
    Semana* sem = [listSemana objectAtIndex:indexPath.row];
    [self showListaDiasSemanaViewController:sem];
    
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

#pragma mark - textfield
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
@end
