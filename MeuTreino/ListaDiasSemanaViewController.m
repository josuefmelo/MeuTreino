//
//  DiasSemanaViewController.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 29/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "ListaDiasSemanaViewController.h"
#import "CadastrarAtividadeViewController.h"
#import "DiasSemanaCell.h"
#import "AtividadeService.h"
@interface ListaDiasSemanaViewController (){
     NSMutableArray* listDiaSemana;
     AtividadeService *atividadeService;
    NSMutableArray * listAtividades;
}
@end

@implementation ListaDiasSemanaViewController

@synthesize idPlanilha;
@synthesize idSemana;
@synthesize semana;

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
    
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
 
    UIImageView *ivBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"] ];
    self.tableView.backgroundView = ivBackground;
    atividadeService = [[AtividadeService alloc] init];
    
    listDiaSemana = [[NSMutableArray alloc]init];
    [listDiaSemana addObject:@"SEGUNDA"];
    [listDiaSemana addObject:@"TERÇA"];
    [listDiaSemana addObject:@"QUARTA"];
    [listDiaSemana addObject:@"QUINTA"];
    [listDiaSemana addObject:@"SEXTA"];
    [listDiaSemana addObject:@"SÁBADO"];
    [listDiaSemana addObject:@"DOMINGO"];
    
    [self addButtonBack:self];
    
    UIImage* img = [UIImage imageNamed:@"top_bar"]  ;
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    UILabel *labelTitle= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180 , 40)];
    labelTitle.textAlignment = UITextAlignmentCenter;
    labelTitle.backgroundColor = [UIColor clearColor];
    
    [labelTitle setText:[NSString stringWithFormat:@"%iª Semana", semana]];

    [labelTitle setTextColor:[UIColor colorWithRed:72.0f/255.0f green:89.0f/255.0f blue:107.0f/255.0f alpha:1.0f]];
    [labelTitle setFont:[UIFont fontWithName:@"Museo900-Regular" size:24.0]];
    self.navigationItem.titleView = labelTitle;

    [super viewDidLoad];

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
    [self.delegate performSelector:@selector(updateTextView) withObject:nil];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
#pragma mark - tableview
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    
//    return 70.0f;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//  
//    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 70)];
//    
//    UILabel* label = [[UILabel alloc]init];
//    label.backgroundColor = [UIColor clearColor];
//    label.numberOfLines = 2;
//    label.frame = CGRectMake(20, 0, 250, 70);
//    label.text = @"Clique no dia da semana para informar as atividades.";
//    [label setFont:[UIFont fontWithName:@"Arial" size:14]];
//    [view addSubview:label];
//    
////    UIButton* btAdd = [UIButton buttonWithType:UIButtonTypeCustom];
////    btAdd.frame = CGRectMake(270, 16, 33, 30);
////    [btAdd setBackgroundImage:[UIImage imageNamed:@"button_add"]forState:UIControlStateNormal];
////    [btAdd addTarget:self action:@selector(pressedBtAdd:) forControlEvents:UIControlEventTouchUpInside];
////    [view addSubview:btAdd];
//    
////    [btAdd release];
//    
//    return view;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [listDiaSemana count];
}

-(void)reloadData{
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DiasSemanaCell";
    
    DiasSemanaCell *cell = (DiasSemanaCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[DiasSemanaCell class]])
            {
                cell = (DiasSemanaCell *)currentObject;
                break;
            }
        }
    }
    
    // Configure the cell...
    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
//    if(indexPath.row == 0 && (indexPath.row +1) == [listDiaSemana count]){
//        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
//    }else if((indexPath.row +1) == [listDiaSemana count]){
//        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bottom"]];
//    }else if(indexPath.row == 0){
//        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_top"]];
//    }else{
//        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell"]];
//    }
    
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundView = img;
    
    //---set the text to display for the cell---
    NSString *cellValue = [listDiaSemana objectAtIndex:indexPath.row];
    
//    cell.label.textColor = [UIColor whiteColor];
    
    cell.label.text = cellValue;
    cell.label.backgroundColor = [UIColor clearColor];
    
    
    int dia = indexPath.row;
    if (dia == 6 ) {
        dia = 1;
    }else{
        dia +=2;
    }

    listAtividades = [atividadeService listBySemana:self.idSemana andDiaSemana:dia];
    NSString *textDetalhe = @"";
    for (Atividade *ativ in listAtividades) {
        cell.labelDetalhe.textColor = [UIColor colorWithRed:194.0f/255.0f green:64.0f/255.0f blue:70.0f/255.0f alpha:1];
        if (ativ.quantidade.length > 0 && [ativ.quantidade isEqualToString:@"(null)"]== NO) {
            textDetalhe = [textDetalhe stringByAppendingFormat:@"%@ : %@", ativ.atividade, ativ.quantidade];
//            break;
        }else{
            textDetalhe = [textDetalhe stringByAppendingString:ativ.atividade];
            
        }
        
        if([listAtividades lastObject] != ativ){
            
            if([ativ.observacao rangeOfString:@"Opcional" options:NSCaseInsensitiveSearch].location != NSNotFound){
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
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    CadastrarAtividadeViewController *atividadeVC = [[CadastrarAtividadeViewController alloc] initWithNibName:@"CadastrarAtividadeViewController" bundle:nil];
    [atividadeVC setPodeEditar:self.podeEditar];
    [atividadeVC setIdPlanilha:idPlanilha];
    [atividadeVC setIdSemana:idSemana];
    int dia = indexPath.row;
    if (dia == 6 ) {
        dia = 1;
    }else{
        dia +=2;
    }
    [atividadeVC setDelegate:self];
    [atividadeVC setDiaTexto: [listDiaSemana objectAtIndex:indexPath.row]];
    [atividadeVC setDiaSemana:dia];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:atividadeVC animated:YES];
    
}

@end
