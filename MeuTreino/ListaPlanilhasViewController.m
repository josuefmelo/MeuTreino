//
//  ListaTreinosViewController.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 25/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "ListaPlanilhasViewController.h"
#import "PlanilhaService.h"
#import "PlanilhaCell.h"
#import "CadastrarPlanilhaViewController.h"
#import "AtividadeService.h"
#import "Semana.h"
#import "SemanaService.h"
@interface ListaPlanilhasViewController (){
    PlanilhaService* planilhaService;
    NSMutableArray * listaPlanilhas;
}


@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ListaPlanilhasViewController
@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    
//    int height = 70;
//
//    
//    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, height)];
//    
//    UILabel* label = [[UILabel alloc]init];
//    label.backgroundColor = [UIColor clearColor];
//    label.numberOfLines = 2;
//
//    label.frame = CGRectMake(20, 0, 250, height);
//    label.text = @"Informe qual é o objetivo, e depois adicione as semanas do seu treino.";
//    
//    label.textColor = [UIColor whiteColor];
//   
//        [label setFont:[UIFont fontWithName:@"Arial" size:14]];
//    
//    [view addSubview:label];
//    
//    return view;
//}

- (void)viewDidLoad
{    
    [super viewDidLoad];
    
    if (planilhaService == nil) {
        planilhaService = [[PlanilhaService alloc]init];
    }
    if (listaPlanilhas == nil) {
        listaPlanilhas = [planilhaService listAll];
    }

    UIImageView *ivBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"] ];
    self.tableView.backgroundView = ivBackground;
    
    [self.navigationController.navigationBar.topItem setTitle: @"Planilhas"];
    UIImage* img = [UIImage imageNamed:@"top_bar"]  ;
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    UILabel *labelTitle= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180 , 40)];
    labelTitle.textAlignment = UITextAlignmentCenter;
    labelTitle.backgroundColor = [UIColor clearColor];
    [labelTitle setTextColor:[UIColor colorWithRed:72.0f/255.0f green:89.0f/255.0f blue:107.0f/255.0f alpha:1.0f]];
    [labelTitle setText:@"Planilhas"];
    [labelTitle setFont:[UIFont fontWithName:@"Museo900-Regular" size:24.0]];
    if (self.delegate) {
        self.navigationItem.titleView = labelTitle;
    }else{
        UINavigationItem  *navTitle = [self.navigationController.navigationBar.items objectAtIndex:0];
        navTitle.titleView = labelTitle;
    }
    
    if (self.delegate) {
        [self addButtonBack:self];
    }else{
        [self addButtonNew:self];
    }
    
    
}

-(void) selectReturnPlanilha:(Planilha*)p{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.delegate performSelector:@selector(selectedPlanilha:) withObject:p];
}

- (void)novoPlanilha:(id)sender
{
    CadastrarPlanilhaViewController* newView = [[CadastrarPlanilhaViewController  alloc]initWithNibName:@"CadastrarPlanilhaViewController" bundle:nil];
    Planilha* planilha = [[Planilha alloc]init];
    planilha.podeEditar = YES;
    [planilhaService insert:planilha];
    [newView setIsNew:YES];
    [newView setDelegate:self];
    [newView setPlanilha:planilha];
    [newView setPlanilhaService:planilhaService];
    
    [self.navigationController pushViewController:newView animated:YES];
}

-(void)reloadData{
    listaPlanilhas = [planilhaService listAll];
    [self.tableView reloadData];
}

-(void) addButtonNew:(UIViewController*)vc{
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [bt setFrame:CGRectMake(0, 0, 34, 30)];
    
    [bt setBackgroundImage:[UIImage imageNamed:@"button_add"] forState:UIControlStateNormal];
    
    [bt addTarget:self action:@selector(novoPlanilha:) forControlEvents:UIControlEventTouchUpInside];
    
//    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [[bt titleLabel] setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];
    
    UIBarButtonItem *button=[[UIBarButtonItem alloc] initWithCustomView:bt];
    vc.navigationItem.rightBarButtonItem=button;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 130.0f;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 120)];
//    UIWebView* webView = [[UIWebView alloc]initWithFrame:view.frame];
//    NSString *template = @"<html> \n"
//    "<head> \n"
//    "<style type=\"text/css\"> \n"
//    "body {font-family: \"%@\"; font-size: %@;}\n"
//    "</style> \n"
//    "</head> \n"
//    "<body>"
//    "<div align='justify'>%@</div>"
//    "</body> \n"
//    "</html>";
//    NSString *t1 = @"Se você dá seus primeiros passos ou já tem uma boa quilometragem, uma planilha sempre pode melhorar seu rendimento. Aqui, você tem acesso planilhas criadas por profissionais. Para quem quer correr por tempo, por diversão, para perder peso, para ganhar velocidade. Não importa seu objetivo, nós mostramos o caminho.";
//   
//    
//    
//    
//    [webView setOpaque:NO];
//    [webView loadHTMLString:[NSString stringWithFormat:template, @"helvetica", [NSNumber numberWithInt:13], t1]baseURL:nil];
//    [webView setBackgroundColor: [UIColor clearColor]];
//    
//        
//    [view addSubview:webView];
//    return view;
//    
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listaPlanilhas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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
//    if(indexPath.row == 0 && (indexPath.row +1) == [listaTreinos count])
//    {   img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
//        
//    }else if((indexPath.row +1) == [listaTreinos count]){
//        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bottom"]];
//    }else if(indexPath.row == 0){
//        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_top"]];
//    }else{
//        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell"]];
//    }
    img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundView = img;
    
    //---set the text to display for the cell---
    Planilha* t = [listaPlanilhas objectAtIndex:indexPath.row];
    NSString *cellValue = t.objetivo;
//    cell.textLabel.backgroundColor =[UIColor clearColor];
//    cell.label.textColor = [UIColor whiteColor];

    cell.label.text = cellValue;
//        cell.textLabel.frame = CGRectMake(300, 300, cell.textLabel.frame.size.width, cell.textLabel.frame.size.height);
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Planilha* obj = [listaPlanilhas objectAtIndex:indexPath.row];
    
    SemanaService *semanaService = [[SemanaService alloc]init];
    NSMutableArray* listSemana = [semanaService listByPlanilha:obj.key];
    
    AtividadeService *atividadeService = [[AtividadeService alloc]init];
    for (Semana* semana in listSemana) {
        [atividadeService removeBySemana:semana.key];
        [semanaService remove:semana.key];
    }
    [planilhaService remove:obj.key];
    
    [listaPlanilhas removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{   
    return YES;
}
-(void) back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate performSelector:@selector(reloadView:) withObject:nil];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Planilha* planilha = [listaPlanilhas objectAtIndex:indexPath.row];
    if (self.delegate) {
        [self selectReturnPlanilha:planilha];
        return;
    }
    CadastrarPlanilhaViewController* cadastrarPlanilha = [[CadastrarPlanilhaViewController  alloc]initWithNibName:@"CadastrarPlanilhaViewController" bundle:nil];
    
    [cadastrarPlanilha setIsNew:NO];
    [cadastrarPlanilha setDelegate:self];
    [cadastrarPlanilha setPlanilha:planilha];
    [cadastrarPlanilha setPlanilhaService:planilhaService];
    
    [self.navigationController pushViewController:cadastrarPlanilha animated:YES];
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


@end
