//
//  AtividadeViewController.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 30/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "CadastrarAtividadeViewController.h"
#import "CadastroAtividadeCell.h"
#import "CustomPickerView.h"
#import "Atividade.h"
#import "AtividadeService.h"
#import "AtividadeDiaCell.h"
#import "ListaAtividadeViewController.h"
@interface CadastrarAtividadeViewController ()
{
    UIActionSheet *actionSheet;
    BOOL diaDescanso;
    NSInteger totalComponentsPicker;
    NSString* valueQuantidadePicker;
    NSString* valueAtividadePicker;
    NSMutableArray* listAtividades;
    CustomPickerView *mypickerView;
    AtividadeService* atividadeService;
}
@end

@implementation CadastrarAtividadeViewController

@synthesize oneColumnList;
@synthesize secondColumnList;
@synthesize thirdColumnList;
@synthesize fourColumnList;
@synthesize idPlanilha;
@synthesize idSemana;
@synthesize diaSemana;
@synthesize diaTexto;
@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.clearsSelectionOnViewWillAppear = NO;
    
    UIImageView *ivBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"] ];
    self.tableView.backgroundView = ivBackground;
    
    UIImage* img = [UIImage imageNamed:@"top_bar"]  ;
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    UILabel *labelTitle= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180 , 40)];
    labelTitle.textAlignment = UITextAlignmentCenter;
    labelTitle.backgroundColor = [UIColor clearColor];
    [labelTitle setTextColor:[UIColor colorWithRed:72.0f/255.0f green:89.0f/255.0f blue:107.0f/255.0f alpha:1.0f]];
    
    [labelTitle setText:diaTexto];
    
    [labelTitle setFont:[UIFont fontWithName:@"Museo900-Regular" size:24.0]];
    self.navigationItem.titleView = labelTitle;
    
    self.oneColumnList = [[NSMutableArray alloc] init];
    
    self.secondColumnList = [[NSMutableArray alloc] init];
    
    self.thirdColumnList = [[NSMutableArray alloc] init];
    
    self.fourColumnList =[[NSMutableArray alloc] init];
    for (int j = 0; j < 60; j++) {
        [fourColumnList addObject:[NSString stringWithFormat:@"%i s", j]];
    }
    
    atividadeService = [[AtividadeService alloc] init];
    
    listAtividades = [atividadeService listBySemana:self.idSemana andDiaSemana:self.diaSemana];
    if ([listAtividades count]== 1) {
        Atividade *ativ = [listAtividades objectAtIndex:0];
        diaDescanso = [ativ.atividade isEqualToString:@"Dia de Descanso"];
    }
    [self addButtonBack:self];
        
    [super viewDidLoad];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    UITextView *tv = object;
//    if (tv.tag  <1) {
//        return;
//    }
    CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale])/2.0;
    topCorrect = ( topCorrect < 0.0 ? 0.0 : topCorrect );
    tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
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
    if (self.podeEditar) {
                for (int i =0 ; i<3; i++) {
                    NSIndexPath * index =  [NSIndexPath indexPathForRow:i inSection:0];
                    CadastroAtividadeCell *cell = (CadastroAtividadeCell*)[self.tableView cellForRowAtIndexPath:index];
                    [cell.textView removeObserver:self forKeyPath:@"contentSize"];
                }
    }
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate performSelector:@selector(reloadData) withObject:nil];
}
-(void) showAlertWithTitle:(NSString *)title andMsg:(NSString *)msg{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil,nil];
    [alertView show];
}

- (IBAction)pressedBtAdd:(id)sender{
    
//    if(diaDescanso){
//        [self showAlertWithTitle:@"Dia de Descanso" andMsg:@"Em dia de descanso não poderá conter outras atividades."];
//        return;
//    }
    
    Atividade* at = [[Atividade alloc]init];
    
    NSIndexPath * index =  [NSIndexPath indexPathForRow:0 inSection:0];
    CadastroAtividadeCell *cell1 = (CadastroAtividadeCell*)[self.tableView cellForRowAtIndexPath:index];
    
    NSString* valueCell = [cell1.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    at.atividade = valueCell;
    at.detalheAtividade = cell1.detalhe;
    
    index =  [NSIndexPath indexPathForRow:1 inSection:0];
    
    CadastroAtividadeCell *cell2 = (CadastroAtividadeCell*)[self.tableView cellForRowAtIndexPath:index];
    
    if ([at.atividade isEqualToString:@"Dia de Descanso"]) {
//        if ([listAtividades count]> 0) {
//            [self showAlertWithTitle:@"Dia de Descanso" andMsg:@"Em dia de descanso não poderá conter outras atividades."];
//            return;
//        }
        diaDescanso = YES;
    }
    
    at.quantidade = [cell2.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    at.diaSemana = self.diaSemana;
    
    at.idSemana = self.idSemana;
    
    if ( at.atividade.length == 0) {
        [self showAlertWithTitle:@"Campos Obrigatórios" andMsg:@"É obrigatório informar a atividade."];
        return;
    }
    if (at.quantidade.length == 0 &&  diaDescanso == NO ) {
        [self showAlertWithTitle:@"Campos Obrigatórios" andMsg:@"É obrigatório informar a quantidade."];
        return;
    }
     index =  [NSIndexPath indexPathForRow:2 inSection:0];
     CadastroAtividadeCell *cell3 = (CadastroAtividadeCell*)[self.tableView cellForRowAtIndexPath:index];
    
    at.observacao = [cell3.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    
    [atividadeService insert:at];
    
    [listAtividades addObject:at];
    
    cell1.detalhe = @"";
    cell2.detalhe = @"";
    cell3.detalhe = @"";
    cell1.textView.text = @"";
    cell2.textView.text = @"";
    cell3.textView.text = @"";
    
    [self.tableView reloadData];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    if (self.podeEditar == NO ) {
        return 1;
    }
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0 && self.podeEditar) {
        return 3;
    }
    return [listAtividades count];
}



-(UITableViewCell *) getCadastroAtividadeCellForm:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CadastroAtividadeCell";
    CadastroAtividadeCell *cell = (CadastroAtividadeCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[CadastroAtividadeCell class]])
            {
                cell = (CadastroAtividadeCell *)currentObject;
                break;
            }
        }
    }
    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    cell.backgroundView = img;
    cell.textView.tag = indexPath.row;
    static int tag = 0;
    @try {
        [cell.textView removeObserver:self forKeyPath:@"contentSize"];

    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
    [cell.textView addObserver:self forKeyPath:@"contentSize" options:0 context:nil];
    tag++;
    switch (indexPath.row) {
        case 0:
//            cell.textView.placeholder = @"Selecione a atividade";
            cell.label.text = @"Atividade:";
            [cell.textView setEditable: NO];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 1:
//            cell.textView.placeholder = @"Selecione a quantidade";
            cell.label.text = @"Quantidade:";
            [cell.textView setEditable: NO];
            break;
        case 2:
//            cell.textField.placeholder = @"Digite aqui a observação";
            cell.label.text = @"Observação:";
            [cell.textView setEditable: YES];
            cell.textView.userInteractionEnabled = YES;
            cell.textView.delegate = self;
            break;
        default:
            break;
    }    
    
    return cell;
    
}


-(void)dealloc{
    if (self.podeEditar) {
//        for (int i =0 ; i<3; i++) {
//            NSIndexPath * index =  [NSIndexPath indexPathForRow:i inSection:0];
//            CadastroAtividadeCell *cell = (CadastroAtividadeCell*)[self.tableView cellForRowAtIndexPath:index];
//            [cell.textView removeObserver:self forKeyPath:@"contentSize"];
//        }
    }
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
    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
    int row = indexPath.row;
    Atividade* at = [listAtividades objectAtIndex:row];
//    cell.label.textColor = [UIColor whiteColor];
    cell.label.backgroundColor = [UIColor clearColor];
     cell.labelObs.text = @"";
    if (at.quantidade.length > 0 && [at.quantidade isEqualToString:@"(null)"]== NO) {
        cell.label.text = [NSString stringWithFormat:@"%@ : %@",at.atividade, at.quantidade];
    }else{
       cell.label.text = at.atividade;
    }
    if (at.detalheAtividade.length > 0 && [at.detalheAtividade isEqualToString:@"(null)"]== NO) {
        cell.labelDetalhe.text = at.detalheAtividade;
    }else{
        cell.labelDetalhe.text = @"";
    }
    
    if (at.observacao.length>0 &&[at.observacao isEqualToString:@"(null)"]== NO) {
        cell.labelObs.text = [NSString stringWithFormat:@"*%@",at.observacao];
    }
    cell.backgroundView = img;
    
    
    return cell;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Cadastro de Atividades";
    }
    return @"Lista de Atividades";
}

// specify the height of your footer section
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 50;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0&& self.podeEditar) {
        return 60;
    }
    return 90;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 70)];
    
    UILabel* label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 2;
    label.frame = CGRectMake(20, 0, 250, 70);
    if (section == 0 && self.podeEditar) {
        label.text = @"Cadastro de Atividades";
    }else{
        label.text = @"Lista de Atividades";
    }
    label.textColor = [UIColor whiteColor];
    
    [label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:17]];
    [view addSubview:label];
    
    if (section == 0&& self.podeEditar) {
        UIButton* btAdd = [UIButton buttonWithType:UIButtonTypeCustom];
        btAdd.frame = CGRectMake(265, 16, 53, 30);
        [btAdd setImage:[UIImage imageNamed:@"button_add"]forState:UIControlStateNormal];
        [btAdd addTarget:self action:@selector(pressedBtAdd:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btAdd];
    }
    
    
    return view;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Atividade* ativ = [listAtividades objectAtIndex:indexPath.row];
    
    [atividadeService remove:ativ.key];
    
    [listAtividades removeObjectAtIndex:indexPath.row];
    if (diaDescanso) {
        diaDescanso = NO;
    }
    [self.tableView reloadData];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return YES;
    }
    return NO;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0 && self.podeEditar){
        return [self getCadastroAtividadeCellForm:indexPath];
    
        
    }else{
        return [self getAtividadeCell:indexPath];
    }
    
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    
    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];

    
    Atividade* at = [listAtividades objectAtIndex:indexPath.row];
//    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    if ([at.atividade isEqualToString:@"Dia de Descanso"]) {
        cell.textLabel.text = at.atividade;
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"%@ : %@",at.atividade, at.quantidade];
    }
    cell.backgroundView = img;
    
    return cell;
}

-(void)selectAtividade:(NSString*)label andDetalhe :(NSString*)detalhe{
    NSIndexPath * index =  [NSIndexPath indexPathForRow:0 inSection:0];
    CadastroAtividadeCell *cell = (CadastroAtividadeCell*)[self.tableView cellForRowAtIndexPath:index];
    cell.textView.text = label;
    cell.detalhe = detalhe;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && self.podeEditar) {
        if (indexPath.row == 0) {
            ListaAtividadeViewController *vc = [[ListaAtividadeViewController alloc]initWithNibName:@"ListaAtividadeViewController" bundle:nil];
            vc.delegate = self;
            [self.navigationController pushViewController:vc animated:YES];
            return;
        }
        if (indexPath.row == 1) {
            [self showPicker:indexPath.row];
        }
    
    }
    
}
#pragma mark - PickerView
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component){
        case 0:
            return [oneColumnList count];
        case 1:
            return [secondColumnList count];
        case 2:
            return [thirdColumnList count];
        default:
            return [fourColumnList count];
    }
   

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{   
    return totalComponentsPicker;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{

    switch (component){
        case 0:
            return [oneColumnList objectAtIndex:row];
        case 1:
            return [secondColumnList objectAtIndex:row];
        case 2:
            return [thirdColumnList objectAtIndex:row];
        default:
            return [fourColumnList objectAtIndex:row];
    }
    
    
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
//    NSString*  string = @"";
//     NSInteger  line = -1;
    if (totalComponentsPicker > 1) {
        if (component ==0) {
            [self reloadDataPicker:row];
            [pickerView reloadComponent:1];
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:1 animated:YES];
            [pickerView selectRow:0 inComponent:2 animated:YES];
            [mypickerView reloadAllComponents];
        }
        
//        NSInteger i = [pickerView selectedRowInComponent:1];
//        NSString* v1 =  nil;
//        if (i>0) {
//            v1 = [secondColumnList objectAtIndex:i];
//        }
//        i = [pickerView selectedRowInComponent:2];
//        NSString* v2 =  nil;
//        if (i>0) {
//            v2 = [thirdColumnList objectAtIndex:i];
//        }
//        if(v1 && v2){
//             string = [NSString stringWithFormat:@"%@ e %@", v1, v2];
//        }else{
//            if (v1) {
//                string = [NSString stringWithFormat:@"%@", v1];
//            }else if (v2) {
//                string = [NSString stringWithFormat:@"%@", v2];
//            }
//        }
//       
//        line = 1;
    }
//        else{
//        string = [oneColumnList objectAtIndex:[pickerView selectedRowInComponent:0]];
//        line = 0;
//    }    
//    NSIndexPath * index =  [[NSIndexPath indexPathForRow:line inSection:0] retain];
//    AtividadeCell *cell = (AtividadeCell*)[self.tableView cellForRowAtIndexPath:index];
//    if(string){
//        cell.textField.text = string;
//    }
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    
    if (totalComponentsPicker ==1) {
        return 300;
    }
    if (totalComponentsPicker > 3) {
        switch (component){
            case 0:
                return 110;
            case 1:
                return 50;
            case 2:
                return 65;
            default:
                return 65;
        }
    }
    switch (component){
        case 0:
            return 120;
        case 1:
            return 80;
        default:
            return 90;
    }
}

- (void) reloadDataPicker:(NSInteger) row{
    [secondColumnList removeAllObjects];
    [thirdColumnList removeAllObjects];
    if(row == 0){
        for (int j = 0; j < 100; j++) {
            [secondColumnList addObject:[NSString stringWithFormat:@"%i km", j]];
        }
        for (int j = 0; j < 1000; j+=100) {
            [thirdColumnList addObject:[NSString stringWithFormat:@"%i mt", j]];
        }
        totalComponentsPicker = 3;
    }else{
        totalComponentsPicker = 4;
        for (int i=0; i < 6; i++) {
            [secondColumnList addObject:[NSString stringWithFormat:@"%i h", i]];
        }
        for (int j = 0; j < 60; j++) {
            [thirdColumnList addObject:[NSString stringWithFormat:@"%i m", j]];
        }
        
    }
   
}

- (void) dismissActionSheet:(id)sender{
    NSString*  string = @"";
    NSInteger  line = -1;
    if (totalComponentsPicker > 1) {
        NSInteger i = [mypickerView selectedRowInComponent:1];
        NSString* v1 =  nil;
        if (i>0) {
            v1 = [secondColumnList objectAtIndex:i];
        }
        i = [mypickerView selectedRowInComponent:2];
        NSString* v2 =  nil;
        if (i>0) {
            v2 = [thirdColumnList objectAtIndex:i];
        }
        if(v1 && v2){
            string = [NSString stringWithFormat:@"%@ e %@", v1, v2];
        }else{
            if (v1) {
                string = [NSString stringWithFormat:@"%@", v1];
            }else if (v2) {
                string = [NSString stringWithFormat:@"%@", v2];
            }
        }
        if (totalComponentsPicker > 3) {
            
            i = [mypickerView selectedRowInComponent:3];
            if (i>0) {
                NSString * v3 = [fourColumnList objectAtIndex:i];
                if (string.length>0) {
                    string  = [string stringByAppendingString:@" e "];
                }
                string  = [string stringByAppendingString:v3];
            }
            string = [string stringByReplacingOccurrencesOfString:@"m" withString:@"min"];
            string = [string stringByReplacingOccurrencesOfString:@"s" withString:@"seg"];
        }
        

        line = 1;
    }else{
        string = [oneColumnList objectAtIndex:[mypickerView selectedRowInComponent:0]];
        line = 0;
    }
    NSIndexPath * index =  [NSIndexPath indexPathForRow:line inSection:0];
    CadastroAtividadeCell *cell = (CadastroAtividadeCell*)[self.tableView cellForRowAtIndexPath:index];
    if(string){
        cell.textView.text = string;
    }
   
    [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    
}


- (void) showPicker:(NSInteger) row{
//    Calcule sua FCM: Subtraia sua idade de 220 e você terá a sua Frequência Cardíaca Máxima (FCM)
//    CA (Caminhada): Entre 50% e 65% da FCM
//    CL (Corrida Leve): Corrida em ritmo confortável. Entre 65% e 75% da FCM
//    CM (Corrida Moderada): Entre 75% e 85% da FCM
//    CF (Corrida Forte): Entre 85% e 95% da FCM
//    CT (Cross-training): Aqui vale tudo: natação, ciclismo, musculação ou qualquer esporte feito paralelamente
//I: Intervalo de descanso
//    TC (Tiros Curtos): Corrida curta e rápida. Entre 85% e 95% da FCM
//    TL (Tiros longos): Um tiro acima de 1 km, que não permite primeiros metros tão rápidos. Entre 85% e 95% da FCM
//    TR (Trote regenerativo): Corrida muito lenta, devagar quase parando. Entre 60% e 70% da FCM
//    R (Recuperação): Tempo de recuperação entre tiros. Pode ser feito caminhando ou trotando
//    RM (Ritmo de Meia maratona): O pace da meia maratona ou ligeiramente mais rápido. Entre 70% e 85% da FCM
//    R10 (Ritmo de 10 km): O pace dos seus melhores 10 km ou de 10 a 15 segundos por minuto mais lento que dos 5 km. Entre 75% e 90% da FCM
//    R5 (Ritmo dos 5 km): O exato ritmo pretendido para correr os 5K. Entre 80% e 90% da FCM
//    SUB (Subida): Treino de subidas moderadas. Entre 85% e 95% da FCM; para as outras siglas, veja a planilha da página anterior
    [oneColumnList removeAllObjects];
    if (row == 0) {
        totalComponentsPicker = 1;
        [oneColumnList addObject:@"Dia de Descanso"];
        [oneColumnList addObject:@"Caminhada"];
        [oneColumnList addObject:@"Caminhada com Ladeiras"];
        [oneColumnList addObject:@"Corrida Leve"];
        [oneColumnList addObject:@"Corrida Moderada"];
        [oneColumnList addObject:@"Corrida Forte"];
        [oneColumnList addObject:@"Cross-training"];
        [oneColumnList addObject:@"Tiros Curtos"];
        [oneColumnList addObject:@"Tiros Longos"];
        [oneColumnList addObject:@"Trote Regenerativo"];
        [oneColumnList addObject:@"Recuperação"];
        [oneColumnList addObject:@"Ritmo de Meia Maratona"];
        [oneColumnList addObject:@"Ritmo de 10 km"];
        [oneColumnList addObject:@"Ritmo de 5 km"];
        [oneColumnList addObject:@"Dia de Prova"];
        [oneColumnList addObject:@"Subida"];
    }else{
        totalComponentsPicker = 3;
        
        
    
        [secondColumnList removeAllObjects];
        [thirdColumnList removeAllObjects];
    
        [oneColumnList addObject:@"Distância"];
        [oneColumnList addObject:@"Tempo"];
       
    
        for (int j = 0; j < 100; j++) {
            [secondColumnList addObject:[NSString stringWithFormat:@"%i km", j]];
        }
        for (int j = 0; j < 1000; j+=50) {
            [thirdColumnList addObject:[NSString stringWithFormat:@"%i mt", j]];
        }
    
    }
     actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:nil
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    
    [actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
    
    mypickerView = [[CustomPickerView alloc] initWithFrame:pickerFrame];
    
    mypickerView.showsSelectionIndicator = YES;
    mypickerView.dataSource = self;
    mypickerView.delegate = self;
    
    [actionSheet addSubview:mypickerView];
    
    UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"OK"]];
    closeButton.momentary = YES;
    closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
    closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
    closeButton.tintColor = [UIColor blackColor];
    [closeButton addTarget:self action:@selector(dismissActionSheet:) forControlEvents:UIControlEventValueChanged];
    [actionSheet addSubview:closeButton];
    
    [actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
    
    [actionSheet setBounds:CGRectMake(0, 0, 320, 485)];
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
