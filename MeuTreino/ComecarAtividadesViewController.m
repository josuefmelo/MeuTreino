//
//  ComecarAtividadesViewController.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 07/05/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "ComecarAtividadesViewController.h"
#import "ComecarAtividadesCell.h"
#import "AtividadeDia.h"
#import <AVFoundation/AVFoundation.h>
#import "PlayerMultiFiles.h"

#define kPollingInterval 1.0



@interface ComecarAtividadesViewController (){
   
    NSTimer *pollingTimer;
    UILabel *timerLabel;
    NSDateFormatter *dateFormatter;
    NSMutableArray *listaSeconds;
    int lineExecution;
    int theTime;
    SystemSoundID soundID;
    AVAudioPlayer *player;
    PlayerMultiFiles *playerMulti;
    int status;
    BOOL pause;
    UIView * viewButtonsInit;
    UIButton* btStart;
    
    
}
typedef enum{
    PARADO = -1,
    INICIADO = 1,
    PAUSADO = 0,
    FINALIZADO = 2,
    
} STATUS;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ComecarAtividadesViewController

@synthesize atividadeDiaService;
@synthesize listaAtividadesDia;
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
    
    lineExecution = 0;
    status = PARADO;
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    
    
    UIImageView *ivBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"] ];
    self.tableView.backgroundView = ivBackground;
    
    listaSeconds = [[NSMutableArray alloc]init];
    
//    [self.navigationController.navigationBar.topItem setTitle: @"Execução"];
    UIImage* img = [UIImage imageNamed:@"top_bar"]  ;
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    UILabel *labelTitle= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180 , 40)];
    labelTitle.textAlignment = UITextAlignmentCenter;
    labelTitle.backgroundColor = [UIColor clearColor];
    [labelTitle setTextColor:[UIColor colorWithRed:72.0f/255.0f green:89.0f/255.0f blue:107.0f/255.0f alpha:1.0f]];
    [labelTitle setText:@"Execução"];
    [labelTitle setFont:[UIFont fontWithName:@"Museo900-Regular" size:24.0]];
//    if (self.delegate) {
        self.navigationItem.titleView = labelTitle;
//    }else{
//        UINavigationItem  *navTitle = [self.navigationController.navigationBar.items objectAtIndex:0];
//        navTitle.titleView = labelTitle;
//    }
//    [self.navigationItem setHidesBackButton:YES];
    [self addButtonBack:self];
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
    
    if (status == PARADO) {
        [self.navigationController popViewControllerAnimated:YES];
        [self.delegate performSelector:@selector(reloadView:)withObject:nil];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Treino"
                                                            message:@"Treino em andamento. Para voltar, finalize o treino."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil,nil];
        [alertView show];
    }
    
    
}

- (void)viewWillDisappear:(BOOL)animated{
     [UIApplication sharedApplication].idleTimerDisabled =  NO;
    if (player.playing) {
        [player stop];
    }
}
-(void) playFalaComFala:(NSString*) fala andDelay:(NSTimeInterval) deplay{
//    while (YES) {
//        if (player.playing == NO) {
//            break;
//        }
//    }
    NSString *path  = [[NSBundle mainBundle] pathForResource:fala ofType:@"m4a"];
    NSURL *pathURL = [NSURL fileURLWithPath : path];
   
//    AudioServicesCreateSystemSoundID((__bridge CFURLRef) pathURL, &soundID);
//    AudioServicesPlaySystemSound(soundID);
//    
//    // call the following function when the sound is no longer used
//    // (must be done AFTER the sound is done playing)
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
//        AudioServicesDisposeSystemSoundID(soundID);
//    });
    
    player = [[AVAudioPlayer alloc]
     initWithContentsOfURL:pathURL error:nil];
    NSTimeInterval now = player.deviceCurrentTime;
    [player setVolume:1.0];
    
    [player playAtTime:now + deplay];
}

-(void)initAtividade{
    
    
    NSNumber *num  = [listaSeconds objectAtIndex:lineExecution];
    theTime = [num intValue];
    NSIndexPath *indexPah =  [NSIndexPath indexPathForRow:0 inSection:0];
    ComecarAtividadesCell *cell =(ComecarAtividadesCell*) [self.tableView cellForRowAtIndexPath:indexPah];
    [self showTime:cell.timerLabel];
   
    NSString* string1  = nil;
    if (lineExecution ==0 ) {
        string1 = @"comecar";
    }else{
        string1 = @"agora";
    }
    NSString* string2  = nil;
    
    if ([cell.labelAtividade.text isEqualToString:@"Caminhada"]) {
        string2 = @"ca";
    }else if ([cell.labelAtividade.text isEqualToString:@"Caminhada com Ladeiras"]) {
        string2 = @"cla";
    }else if ([cell.labelAtividade.text isEqualToString:@"Corrida Leve"]) {
        string2 = @"cl";
    }else if ([cell.labelAtividade.text isEqualToString:@"Corrida Forte"]) {
        string2 = @"cf";
    }else if ([cell.labelAtividade.text isEqualToString:@"Corrida Moderada"]) {
        string2 = @"cm";
    }else if ([cell.labelAtividade.text isEqualToString:@"Trote Regenerativo"]) {
        string2 = @"tr";
    }else if ([cell.labelAtividade.text isEqualToString:@"Recuperação"]) {
        string2 = @"r";
    }else if ([cell.labelAtividade.text isEqualToString:@"Intervalos de descanso"]) {
        string2 = @"id";
    }else if ([cell.labelAtividade.text isEqualToString:@"Ritmo de Meia Maratona"]) {
        string2 = @"rmm";
    }else if ([cell.labelAtividade.text isEqualToString:@"Ritmo de 10 km"]) {
        string2 = @"r10";
    }else if ([cell.labelAtividade.text isEqualToString:@"Ritmo de 5 km"]) {
        string2 = @"r5";
    }else if ([cell.labelAtividade.text isEqualToString:@"Subida Moderada"]) {
        string2 = @"sm";
    }else if ([cell.labelAtividade.text isEqualToString:@"Tiros Curtos"]) {
        string2 = @"tc";
    }else if ([cell.labelAtividade.text isEqualToString:@"Tiros Longos"]) {
        string2 = @"tl";
    }else if ([cell.labelAtividade.text isEqualToString:@"Alongamento"]) {
        string2 = @"al";
    }else if ([cell.labelAtividade.text isEqualToString:@"Musculação"]) {
        string2 = @"mu";
    }
    
    playerMulti = [[PlayerMultiFiles alloc]initWithFileNameQueue:[NSArray arrayWithObjects:string1,string2, nil]];
    
    pollingTimer = [NSTimer scheduledTimerWithTimeInterval:kPollingInterval
                                                    target:self
                                                  selector:@selector(pollTime:)
                                                  userInfo:cell
                                                   repeats:YES];
}
- (void)showTime:(UILabel*)time {
    
    int seconds = theTime % 60;
    int minutes = (theTime / 60) % 60;
    int hours = theTime / 3600;
    
    time.text = [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
    
}
- (void) pollTime:(NSTimer *)timer
{
    if (pause) {
        return;
    }
    if (--theTime < 0){
        [timer invalidate];
        timer =nil;
        
        lineExecution++;
        if (lineExecution < [listaAtividadesDia count]) {
            [self.tableView reloadData];
            
        }else if (lineExecution == [listaAtividadesDia count] ) {
            status = FINALIZADO;
            playerMulti = [[PlayerMultiFiles alloc]initWithFileNameQueue:[NSArray arrayWithObject:@"termino"]];
            [self changeButtonFinalizar];
            
        }
    }
    if (theTime == 4) {
        playerMulti = [[PlayerMultiFiles alloc]initWithFileNameQueue:[NSArray arrayWithObjects:@"alerta",@"alerta",@"alerta",@"alerta",@"alerta", nil]];
    }
    ComecarAtividadesCell *cell = [timer userInfo];
    [self showTime:cell.timerLabel];
}

- (void) finalizarAtividades{
    for (int i = 0; i < lineExecution; i++) {
        AtividadeDia *at =[listaAtividadesDia objectAtIndex:i];
        at.feito = YES;
        [atividadeDiaService updateFeito:at];
    }
    
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
//    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ComecarAtividadesCell";
    
    ComecarAtividadesCell *cell = (ComecarAtividadesCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[ComecarAtividadesCell class]])
            {
                cell = (ComecarAtividadesCell *)currentObject;
                break;
            }
        }
    }
    UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round"]];
    
    cell.backgroundView = img;
    
    AtividadeDia *at =[listaAtividadesDia objectAtIndex:lineExecution];
    cell.labelAtividade.text = at.atividade;
 
    theTime =  [self labelTimeWithAtividade:at.atividade andQuantidade:at.quantidade];
    
    cell.labelAtFeita.text = [NSString stringWithFormat:@"Atividade %i/%i:", lineExecution+1, [listaAtividadesDia count]];
    
    
    [listaSeconds insertObject:[NSNumber numberWithInt:theTime] atIndex:lineExecution];
    
    [self showTime:cell.timerLabel];
    if (lineExecution > 0) {
        
        [self performSelector:@selector(initAtividade) withObject:self afterDelay:2];
    }
    return cell;
}

-(int)labelTimeWithAtividade:(NSString*)atividade andQuantidade:(NSString*)qtde{
    int seconds = 0;
    NSString *string = qtde;
    int km = 0;
    int mt = 0;
    int s = 0;
    int min=0;
    int h = 0;
    NSInteger posH = [string rangeOfString:@" h"].location;
    NSInteger posMIN = [string rangeOfString:@" min"].location;
    NSInteger posSEG = [string rangeOfString:@" seg"].location;
    string = [string stringByReplacingOccurrencesOfString:@" e" withString:@""];
    if (posH != NSNotFound || posMIN != NSNotFound || posSEG != NSNotFound) {
        if ( posH!= NSNotFound) {
            h = [[string substringToIndex:posH] intValue];
            string = [string stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%i h", h]  withString:@""];
        }
        
        if ( posMIN!= NSNotFound) {
            posMIN = [string rangeOfString:@" min"].location;
            min = [[string substringToIndex:posMIN] intValue];
            string = [string stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%i min", min]  withString:@""];
        }
        if ( posSEG!= NSNotFound) {
            posSEG = [string rangeOfString:@" seg"].location;
            s = [[string substringToIndex:posSEG] intValue];
            string = [string stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%i s", s]  withString:@""];
        }
        
        seconds = (h*3600)+(min*60)+s;
        return seconds;
    }
    
    NSInteger posKM = [string rangeOfString:@" km"].location;
    NSInteger posMT = [string rangeOfString:@" m"].location;
    
    if ( posKM!= NSNotFound ||  posMT != NSNotFound) {
        if ( posKM!= NSNotFound) {
            km = [[string substringToIndex:posKM] intValue];
        }
        if (posMT != NSNotFound) {
            string = [string stringByReplacingOccurrencesOfString:@" m" withString:@""];
            string = [string stringByReplacingOccurrencesOfString:@"t" withString:@""];
            if (km > 0) {
                mt = [[string substringFromIndex:(posKM+[string rangeOfString:@" km"].length + 3)]intValue];
            }else{
                mt = [string intValue];
            }
        }
        if ([atividade rangeOfString:@"Caminhada"].location != NSNotFound) {
            seconds = [atividadeDiaService converteEmSegundosCaminhadaComKM:km andMetros:mt];
        }else if([atividade rangeOfString:@"Corrida Leve"].location != NSNotFound){
            seconds = [atividadeDiaService converteEmSegundosCorridaLeveComKM:km andMetros:mt];
        }else if([atividade rangeOfString:@"Corrida Forte"].location != NSNotFound){
            seconds  = [atividadeDiaService converteEmSegundosCorridaForteComKM:km andMetros:mt];
        }else if([atividade rangeOfString:@"Corrida Moderada"].location != NSNotFound){
            seconds  = [atividadeDiaService converteEmSegundosCorridaModeradaComKM:km andMetros:mt];
        }else if([atividade rangeOfString:@"1O km"].location != NSNotFound){
            seconds  = [atividadeDiaService converteEmSegundosRitimo10ComKM:km andMetros:mt];
        }else if([atividade rangeOfString:@"5 km"].location != NSNotFound){
            seconds  = [atividadeDiaService converteEmSegundosRitimo5ComKM:km andMetros:mt];
        }else if([atividade rangeOfString:@"Meia Maratona"].location != NSNotFound){
            seconds  = [atividadeDiaService converteEmSegundosRitimoMeiaMaratonaComKM:km andMetros:mt];
        }else if([atividade rangeOfString:@"Tiro"].location != NSNotFound){
            seconds = [atividadeDiaService converteEmSegundosTirosComKM:km andMetros:mt];
        }else if([atividade rangeOfString:@"Trote"].location != NSNotFound){
            seconds  = [atividadeDiaService converteEmSegundosTroteComKM:km andMetros:mt];
        }
    }
    return  seconds;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 80;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    int height = 80;
    
     viewButtonsInit = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, height)];
    
    btStart = [UIButton buttonWithType:UIButtonTypeCustom];
    btStart.frame = CGRectMake(20, 16, 280, 63);
    [btStart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[btStart titleLabel] setFont:[UIFont fontWithName:@"Arial-BoldMT" size:32]];
    
    if (status == INICIADO) {
        [btStart setTitle:@"Pausar" forState:UIControlStateNormal];
        [btStart addTarget:self action:@selector(pressedBtPausar:) forControlEvents:UIControlEventTouchUpInside];
        [btStart setBackgroundImage:[UIImage imageNamed:@"button_stop"] forState:UIControlStateNormal];
    }else{
        [btStart setTitle:@"Iniciar" forState:UIControlStateNormal];
        [btStart setBackgroundImage:[UIImage imageNamed:@"button_start"] forState:UIControlStateNormal];
        [btStart addTarget:self action:@selector(pressedBtIniciar:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [viewButtonsInit addSubview:btStart];
    return viewButtonsInit;
}

- (void) stop{
    pause = YES;
}
- (void) pressedBtIniciar:(id)sender{
    
    status = INICIADO;
    
    [self.navigationItem setHidesBackButton:YES];
    [self initAtividade];

    [btStart setTitle:@"Pausar" forState:UIControlStateNormal];
    [btStart setBackgroundImage:[UIImage imageNamed:@"button_stop"] forState:UIControlStateNormal];
    [btStart removeTarget:self action:@selector(pressedBtIniciar:) forControlEvents:UIControlEventTouchUpInside];
    [btStart addTarget:self action:@selector(pressedBtPausar:) forControlEvents:UIControlEventTouchUpInside];
    [UIView commitAnimations];
}

- (void) changeButtonFinalizar{
    [btStart setTitle:@"Finalizar" forState:UIControlStateNormal];
    [btStart setBackgroundImage:[UIImage imageNamed:@"button_stop"] forState:UIControlStateNormal];
    [btStart removeTarget:self action:@selector(pressedBtPausar:) forControlEvents:UIControlEventTouchUpInside];
    [btStart addTarget:self action:@selector(pressedBtFinalizar:) forControlEvents:UIControlEventTouchUpInside];
    [UIView commitAnimations];
}
- (void) continuar{
    pause = NO;
}
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *titleButton = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([titleButton isEqualToString:@"Sim"]) {
        [self finalizarAtividades];
        status = PARADO;
        [self back:nil];
        
    }
}
- (void) pressedBtFinalizar:(id)sender{
    
    if (status == FINALIZADO) {
        [self finalizarAtividades];
        status = PARADO;    
        [self back:sender];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Finalizar"
                                                            message:@"Todas atividades ainda não foram completadas. Deseja realmente finalizar seu treino?"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancelar"
                                                  otherButtonTitles:@"Sim",nil];
        [alertView show];
    }
}
- (void) pressedBtPausar:(id)sender{
    
    UIButton* btFinalizar = [UIButton buttonWithType:UIButtonTypeCustom];
    btFinalizar.frame = CGRectMake(15, 16, 140, 63);
    [btFinalizar setTitle:@"Finalizar" forState:UIControlStateNormal];
    [btFinalizar setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btFinalizar setBackgroundImage:[UIImage imageNamed:@"button_stop"] forState:UIControlStateNormal];
    [[btFinalizar titleLabel] setFont:[UIFont fontWithName:@"Arial-BoldMT" size:24]];
    [btFinalizar addTarget:self action:@selector(pressedBtFinalizar:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btContinuar = [UIButton buttonWithType:UIButtonTypeCustom];
    btContinuar.frame = CGRectMake(165, 16, 140, 63);
    [btContinuar setTitle:@"Continue" forState:UIControlStateNormal];
    [btContinuar setBackgroundImage:[UIImage imageNamed:@"button_start"] forState:UIControlStateNormal];
    [btContinuar setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[btContinuar titleLabel] setFont:[UIFont fontWithName:@"Arial-BoldMT" size:24]];
    [btContinuar addTarget:self action:@selector(pressedBtContiuar:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [[viewButtonsInit subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [viewButtonsInit addSubview:btContinuar];
    [viewButtonsInit addSubview:btFinalizar];
    [UIView commitAnimations];
    
    if (status) {
        [self stop];
    }
    status = PAUSADO;
    
}
- (void) pressedBtContiuar:(id)sender{
    [self continuar];
    [[viewButtonsInit subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [viewButtonsInit addSubview:btStart];
    [UIView commitAnimations];
     status = INICIADO;
}
@end
