//
//  ListaAtividadeViewController.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 15/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "ListaAtividadeViewController.h"
#import "AtividadeDiaCell.h"

@interface ListaAtividadeViewController (){
    NSMutableArray *listAtividades;
    NSMutableArray *listDetalheAtividades;
}

@end

@implementation ListaAtividadeViewController
@synthesize delegate;
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
    
    listAtividades = [[NSMutableArray alloc]init];
    listDetalheAtividades = [[NSMutableArray alloc]init];
    
    [listAtividades addObject:@"Dia de Descanso"];
    [listDetalheAtividades addObject:@"Quando você descansa é que melhora seu desempenho, o corpo se recupera e promove melhorias no organismo"];
    
    [listAtividades addObject:@"Alongamento"];
    [listDetalheAtividades addObject:@"O alongamento é parte de um aquecimento fundamental para o esforço que vem pela frente"];
    
    [listAtividades addObject:@"Caminhada"];
    [listDetalheAtividades addObject:@"Entre 50% e 65% da FCM"];
    
    [listAtividades addObject:@"Caminhada com Ladeiras"];
    [listDetalheAtividades addObject:@"Entre 50% e 65% da FCM em ambientes com subidas"];
    
    [listAtividades addObject:@"Corrida Leve"];
    [listDetalheAtividades addObject:@"Corrida em ritmo confortável. Entre 65% e 75% da FCM"];
    
    [listAtividades addObject:@"Corrida Moderada"];
    [listDetalheAtividades addObject:@"Entre 75% e 85% da FCM"];
    
    [listAtividades addObject:@"Corrida Forte"];
    [listDetalheAtividades addObject:@"Entre 85% e 95% da FCM"];
    
    [listAtividades addObject:@"Cross-training"];
    [listDetalheAtividades addObject:@"Aqui vale tudo: natação, ciclismo, musculação ou qualquer esporte feito paralelamente"];
    
    [listAtividades addObject:@"Musculação"];
    [listDetalheAtividades addObject:@"Contribui para o fortalecimento dos músculos e articulações, ajuda prevenir lesões e melhora o desempenho do atleta"];
    
    [listAtividades addObject:@"Intervalos de descanso"];
    [listDetalheAtividades addObject:@"É uma pausa programada entre um exercício e outro"];
    
    [listAtividades addObject:@"Tiros Curtos"];
    [listDetalheAtividades addObject:@"Corrida curta e rápida. Entre 85% e 95% da FCM"];
    
    [listAtividades addObject:@"Tiros Longos"];
    [listDetalheAtividades addObject:@"Um tiro acima de 1 km, não permite primeiros metros tão rápidos. Entre 85% e 95% da FCM"];
    
    [listAtividades addObject:@"Trote Regenerativo"];
    [listDetalheAtividades addObject:@"Corrida muito lenta, devagar quase parando. Entre 60% e 70% da FCM"];
    
    [listAtividades addObject:@"Recuperação"];
    [listDetalheAtividades addObject:@"Tempo de recuperação entre tiros. Pode ser feito caminhando ou trotando"];
    
    [listAtividades addObject:@"Ritmo de Meia Maratona"];
    [listDetalheAtividades addObject:@"O pace da meia maratona ou ligeiramente mais rápido. Entre 70% e 85% da FCM"];
    
    [listAtividades addObject:@"Ritmo de 10 km"];
    [listDetalheAtividades addObject:@"Pace dos melhores 10km ou 10-15 seg/min mais lento que dos 5km. Entre 75%-90% da FCM"];
    
    [listAtividades addObject:@"Ritmo de 5 km"];
    [listDetalheAtividades addObject:@"O exato ritmo pretendido para correr os 5K. Entre 80% e 90% da FCM"];
    
    [listAtividades addObject:@"Subida Moderada"];
    [listDetalheAtividades addObject:@"Treino de subidas moderadas. Entre 85% e 95% da FCM"];
    
    [listAtividades addObject:@"Dia de Prova"];
    [listDetalheAtividades addObject:@"Chegou o grande dia. Dia de realizar a prova de todo seu treinamento."];
    
    UIImageView *ivBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"] ];
    self.tableView.backgroundView = ivBackground;
    
    [self addButtonBack:self];
    [self setTitle:@"Atividades"];
//    UIImage* img = [UIImage imageNamed:@"top_nav_bar"]  ;
//    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    
    
    UIImage* img = [UIImage imageNamed:@"top_bar"]  ;
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    UILabel *labelTitle= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180 , 40)];
    labelTitle.textAlignment = UITextAlignmentCenter;
    labelTitle.backgroundColor = [UIColor clearColor];
    [labelTitle setTextColor:[UIColor colorWithRed:72.0f/255.0f green:89.0f/255.0f blue:107.0f/255.0f alpha:1.0f]];
    [labelTitle setText:@"Atividades"];
    [labelTitle setFont:[UIFont fontWithName:@"Museo900-Regular" size:24.0]];
    self.navigationItem.titleView = labelTitle;
    
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
    
    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundView = img;
    
    int row = (indexPath.section*7) + indexPath.row;
    
    NSString* obj1 = [listAtividades objectAtIndex:row];
    NSString* obj2 = [listDetalheAtividades objectAtIndex:row];
    NSString *cellValue =nil;

    cellValue = obj1;
    
//    cell.label.textColor = [UIColor whiteColor];
    
    cell.label.text = cellValue;
    
    cell.labelDetalhe.text = obj2;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* obj1 = [listAtividades objectAtIndex:indexPath.row];
    NSString* obj2 = [listDetalheAtividades objectAtIndex:indexPath.row];
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate performSelector:@selector(selectAtividade:andDetalhe:) withObject:obj1 withObject:obj2];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [listAtividades count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
@end
