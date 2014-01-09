//
//  ListaPlanilhasRealizadasViewController.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 24/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "ListaHistoricoViewController.h"
#import "TreinoService.h"
#import "Treino.h"
#import "HistoricoCell.h"
#import "ListaDiasTreinoViewController.h"
#import "DateUtil.h"
#import "AtividadeDia.h"
#import "AtividadeDiaService.h"
#import "DiaTreino.h"
#import "DiaTreinoService.h"

@interface ListaHistoricoViewController (){
    NSMutableArray *listTreinos;
    BOOL isInit;
    UIAlertView *loading;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) TreinoService *treinoService;

@end

@implementation ListaHistoricoViewController

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
    self.treinoService = [[TreinoService alloc]init];
    
    listTreinos = [self.treinoService listAllRealizadas];
    [super viewDidLoad];
    
    UIImageView *ivBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"] ];
    self.tableView.backgroundView = ivBackground;
    
    UIImage* img = [UIImage imageNamed:@"top_bar"]  ;
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    UILabel *labelTitle= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180 , 40)];
    labelTitle.textAlignment = UITextAlignmentCenter;
    labelTitle.backgroundColor = [UIColor clearColor];
    [labelTitle setTextColor:[UIColor colorWithRed:72.0f/255.0f green:89.0f/255.0f blue:107.0f/255.0f alpha:1.0f]];
    [labelTitle setText:@"Histórico"];
    [labelTitle setFont:[UIFont fontWithName:@"Museo900-Regular" size:24.0]];
 
    UINavigationItem  *navTitle = [self.navigationController.navigationBar.items objectAtIndex:0];
    navTitle.titleView = labelTitle;
    
    
    
}

-(void)loadViewEmpty{
    UILabel *scoreLabel = [ [UILabel alloc ] initWithFrame:CGRectMake(0, 10, 320, 40) ];
    scoreLabel.textAlignment =  UITextAlignmentCenter;
    scoreLabel.textColor = [UIColor whiteColor];
    scoreLabel.backgroundColor = [UIColor clearColor];
    scoreLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(17.0f)];
    [self.tableView addSubview:scoreLabel];
    scoreLabel.text = @"Nenhum histórico ainda.";
    
    UIImageView *emptyImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"historico_empty"] ];
    emptyImageView.frame = CGRectMake(10, 50, emptyImageView.frame.size.width, emptyImageView.frame.size.height);
    
    [self.tableView addSubview:emptyImageView];
    
}

-(void)viewDidAppear:(BOOL)animated{
    if (isInit) {
        [self.tableView.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
        [self reloadView:nil];
    }
    if ([listTreinos count]==0) {
        [self loadViewEmpty];
    }
    isInit= YES;
}

-(void)reloadView:(id)sender{
    listTreinos = [self.treinoService listAllRealizadas];
    [self.tableView reloadData];
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
#pragma mark - TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [listTreinos count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"HistoricoCell";
    
    HistoricoCell *cell = (HistoricoCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[HistoricoCell class]])
            {
                cell = (HistoricoCell *)currentObject;
                break;
            }
        }
    }
    UIImageView* img = nil;
    img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundView = img;
    
    //---set the text to display for the cell---
    Treino* t = [listTreinos objectAtIndex:indexPath.row];
    NSString *cellValue = t.planilha;
    cell.labelDesc.text = cellValue;

    NSString *dataInicio = [DateUtil timeIntervalToString:t.dataInicio];
    cell.labelDataInicio.text = [NSString stringWithFormat:@"Data Início: %@", dataInicio];
    
    NSString *dataFim = t.dataFim == 0 ? @"" :[DateUtil timeIntervalToString:t.dataFim];
    cell.labelDataFim.text = [NSString stringWithFormat:@"Data Fim: %@", dataFim];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListaDiasTreinoViewController *vc = [[ListaDiasTreinoViewController alloc]initWithNibName:@"ListaDiasTreinoViewController" bundle:nil];
    Treino* t = [listTreinos objectAtIndex:indexPath.row];
    [vc setIdTreino:t.key];
    vc.isHiddenButtonLike = YES;
    [self.navigationController pushViewController:vc animated:YES];
       
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    loading = [[UIAlertView alloc] initWithTitle:@"Apagando treino, aguarde..."
                                         message:@"\n"
                                        delegate:self
                               cancelButtonTitle:nil
                               otherButtonTitles:nil];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(139.5, 75.5); // .5 so it doesn't blur
    [loading addSubview:spinner];
    [spinner startAnimating];
    [loading show];
    [self performSelector:@selector(apagar:) withObject:indexPath afterDelay:2];
    
}
-(void) apagar:(NSIndexPath *)indexPath{
    
    Treino* obj = [listTreinos objectAtIndex:indexPath.row];
    
    DiaTreinoService *dtService = [[ DiaTreinoService alloc]init];
    AtividadeDiaService *adService = [[AtividadeDiaService alloc]init];
    NSMutableArray *listDT = [dtService listByTreino:obj.key];
    for (DiaTreino *dt in listDT) {
        [adService removeWithDiaTreino:dt.key];
        [dtService remove:dt.key];
    }
    [self.treinoService remove:obj.key];
    [listTreinos removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
    if ([listTreinos count]==0) {
        [self loadViewEmpty];
    }
    [loading dismissWithClickedButtonIndex:0 animated:YES];
}

@end
