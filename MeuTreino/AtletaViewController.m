//
//  AtletaViewController.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 02/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "AtletaViewController.h"
#import "AtletaCell.h"
#import "DateUtil.h"
#import "Atleta.h"
#import "AtletaService.h"

@interface AtletaViewController (){
    UIActionSheet* pickerAction;
    UIDatePicker* datePicker;
    UIToolbar* toolbarPicker;
    UITextField* textFieldPicker;
    UIPickerView* myPickerView;
    Atleta* atleta;
    AtletaService* atletaService;
    int idade;
    
}

@end

@implementation AtletaViewController

@synthesize oneColumnList;
@synthesize secondColumnList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(int) calculaIdade:(NSString*)data{
    NSString *start = data;
    
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"dd/MM/yyyy"];
    NSDate *startDate = [f dateFromString:start];
    NSDate *endDate = [NSDate date];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components:NSYearCalendarUnit
                                                        fromDate:startDate
                                                          toDate:endDate
                                                         options:0];    
    int i = [components year];
    return  i;
    
}

- (NSString*) numberToFormatter:(double)number andDigit:(int) d{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setGeneratesDecimalNumbers:YES];
    [formatter setMaximumFractionDigits:d];
    [formatter setMinimumFractionDigits:d];
    if (d>0) {
        [formatter setDecimalSeparator:@","];
    }else{
        [formatter setDecimalSeparator:@""];
    }
    [formatter setAlwaysShowsDecimalSeparator:YES];
    NSString* fmt =  [formatter stringFromNumber:[NSNumber numberWithFloat:number]];
    return fmt;
}

- (double) formatterToNumber:(NSString*)number{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setGeneratesDecimalNumbers:YES];
    [formatter setMaximumFractionDigits:2];
    [formatter setMinimumFractionDigits:2];
    [formatter setDecimalSeparator:@","];
    [formatter setAlwaysShowsDecimalSeparator:YES];
    return [[formatter numberFromString:number] doubleValue];
}


- (double) calculaIMCWithPeso:(double) peso andAltura:(double)altura{
    if (peso > 0 && altura > 0) {
        return peso/(altura*altura);
    }
    return 0;
}

- (int) calculaFMCWithIdade:(int) i {
    
    return 220 - i ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImageView *ivBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"] ];
    self.tableView.backgroundView = ivBackground;
    NSString *title =  NSLocalizedString(@"Atleta",nil);
    [self setTitle:title];

    
    UIImage* img = [UIImage imageNamed:@"top_bar"]  ;
    [self.navBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    [self.navBar  setTintColor:[UIColor whiteColor]];
    UILabel *labelTitle= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 75 , 40)];;
    labelTitle.backgroundColor = [UIColor clearColor];
    [labelTitle setTextColor:[UIColor colorWithRed:72.0f/255.0f green:89.0f/255.0f blue:107.0f/255.0f alpha:1.0f]];
    
    [labelTitle setText:title];
    [labelTitle setFont:[UIFont fontWithName:@"Museo900-Regular" size:24.0]];
    self.navTitle.titleView = labelTitle;
    
    self.oneColumnList = [[NSMutableArray alloc] init];
    
    self.secondColumnList = [[NSMutableArray alloc] init];
    
    atletaService = [[AtletaService alloc]init];
    
    atleta = [atletaService get];
//    
//    [[UINavigationBar appearance] setTitleTextAttributes: @{
//                                UITextAttributeTextColor: [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
//                          UITextAttributeTextShadowColor: [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],
//                         UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 1.0f)],
//                                     UITextAttributeFont: [UIFont fontWithName:@"Museo900-Regular" size:20.0f]
//     }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AtletaCell";
    AtletaCell *cell = (AtletaCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[AtletaCell class]])
            {
                cell = (AtletaCell *)currentObject;
                break;
            }
        }
    }
    UIImageView* img = nil;
    if (indexPath.row == 0) {
        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round_top2"]];
    }else{
        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_round_bottom2"]];
    }

//    UIImageView* img = nil;
//    if(indexPath.row == 0){
//        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_top"]];
//    }else{
//        img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bottom"]];
//    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundView = img;
    
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                cell.textField.placeholder = @"Nome do atleta";
                cell.label.text = @"Nome:";
                if (atleta.name.length > 0) {
                    cell.textField.text = atleta.name;
                }
                
            }else{
                cell.textField.placeholder = @"Data de nascimento";
                cell.label.text = @"Nasc:";
                cell.textField.enabled = NO;
                if (atleta.dataNascimento.length > 0) {
                    cell.textField.text = atleta.dataNascimento;
                    idade = [self calculaIdade:atleta.dataNascimento];
                    
                }
            }
            break;
        case 1:
            if (indexPath.row == 0) {
                cell.textField.placeholder = @"Peso em Kg";
                cell.label.text = @"Peso:";
                cell.textField.enabled = NO;
                if (atleta.peso > 0) {
                    int frac = [self getFranctionaNumber:atleta.peso];
                    int digit = 1 ;
                    if (frac==0) {
                        digit = 0;
                    }
                    cell.textField.text = [NSString stringWithFormat:@"%@ Kg",[self numberToFormatter:atleta.peso andDigit:digit]];
                }
                
            }else{
                
                cell.textField.placeholder = @"Altura em metros";
                cell.textField.enabled = NO;
                cell.label.text = @"Altura:";
                if (atleta.altura > 0) {
                    int frac = [self getFranctionaNumber:atleta.altura];
                    int digit = 2;
                    if (frac == 0) {
                        digit = 0;
                    }
                    cell.textField.text = [NSString stringWithFormat:@"%@ m",[self numberToFormatter:atleta.altura andDigit:digit]];
                }
            }
            break;
            
        case 2:
            if (indexPath.row == 0) {
                cell.textField.placeholder = @"Índice de Massa Corporal";
                cell.label.text = @"IMC:";
                [cell.textField setKeyboardType:UIKeyboardTypeNumberPad];
                cell.textField.enabled = NO;
                double imc = [self calculaIMCWithPeso:atleta.peso andAltura:atleta.altura];
                if (imc>0) {
                    cell.textField.text =  [NSString stringWithFormat:@"%@ %@",[self numberToFormatter:imc andDigit:2], [self getDescIMC:imc]];;
                }
            }else{
                cell.textField.placeholder = @"Frequência Máxima Cardíaca";
                [cell.textField setKeyboardType:UIKeyboardTypeNumberPad];
                cell.label.text = @"FCM:";
                cell.textField.enabled = NO;
                if (atleta.dataNascimento.length>0) {
                    int fmc =   [self calculaFMCWithIdade:idade];
                    cell.textField.text= [NSString stringWithFormat:@"%i BPM", fmc];;
                }
            }
            break;
            
        default:
            break;
    }
    
    cell.textField.delegate = self;
    return cell;
}

-(int) getFranctionaNumber:(double)num{
    NSString *str=[NSString stringWithFormat:@"%f",num];
    NSArray *arr=[str componentsSeparatedByString:@"."];
    int tempInt=[[arr lastObject] intValue];
    return tempInt;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 35;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    int height = 35;

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, height)];
    
    UILabel* label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 2;
    label.frame = CGRectMake(20, 5, 250, height);
    switch (section) {
        case 0:
            label.text = @"Dados Pessoais";
            break;
        case 1:
            label.text = @"Medidas";
            break;
        case 2:
            label.text = @"Resultados";
            break;
            
        default:
            break;
    }
    
    [label setFont:[UIFont fontWithName:@"Arial-BoldMT" size:15]];
    [view addSubview:label];
   
    return view;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            AtletaCell* cell = (AtletaCell*)[tableView cellForRowAtIndexPath:indexPath];
            textFieldPicker = cell.textField;
            [self ChooseDP];
        }
    }
    if (indexPath.section == 1 ) {
        AtletaCell* cell = (AtletaCell*)[tableView cellForRowAtIndexPath:indexPath];
        textFieldPicker = cell.textField;
        [self showPicker:indexPath.row];

    }

}

- (void)viewDidUnload {
    [self setTableView:nil];
    [self setNavBar:nil];
    [self setNavTitle:nil];
    [super viewDidUnload];
}

#pragma mark - textfield
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    atleta.name = textField.text;
    [atletaService update:atleta];
    return NO;
}

#pragma mark -  PickerView

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
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    AtletaCell* cell = (AtletaCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell.textField.text length] >0) {
        [datePicker setDate:[DateUtil stringToDate:cell.textField.text]];
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

-(IBAction)dateChanged{
    //format date
    NSDateFormatter *FormatDate = [[NSDateFormatter alloc] init];
    
    //set date format
    [FormatDate setDateFormat:@"dd/MM/YYYY"];
    //update date textfield
    textFieldPicker.text = [FormatDate stringFromDate:[datePicker date]];
    atleta.dataNascimento = textFieldPicker.text;
    [atletaService update:atleta];
    idade = [self calculaIdade:textFieldPicker.text];
    [self loadFMC];
}

- (void)loadFMC{
    int fmc =   [self calculaFMCWithIdade:idade];
    AtletaCell* cell = (AtletaCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:2]];
    cell.textField.text= [NSString stringWithFormat:@"%i BPM", fmc];
}

-(BOOL)closeDatePicker:(id)sender{
    [pickerAction dismissWithClickedButtonIndex:0 animated:YES];
    [textFieldPicker resignFirstResponder];
    
    return YES;
}

//action when done button is clicked
-(IBAction)DoneClicked{
    [self dateChanged];
    
    [self closeDatePicker:self];
    datePicker.frame=CGRectMake(0, 44, 320, 416);
    
}

//returns number of components in pickerview
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}


//returns number of rows in date picker
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return [oneColumnList count];
    }
    return [secondColumnList count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [oneColumnList objectAtIndex:row];
    }
    return [secondColumnList objectAtIndex:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 90;
}

- (void) showPicker:(NSInteger) row{
    [oneColumnList removeAllObjects];
    [secondColumnList removeAllObjects];
    if (row == 0) {
        for (int j = 1; j < 300; j++) {
            [oneColumnList addObject:[NSString stringWithFormat:@"%i kg", j]];
        }
        for (int j = 0; j < 1000; j+=100) {
            [secondColumnList addObject:[NSString stringWithFormat:@"%i g", j]];
        }
    }else{
        for (int j = 1; j < 3; j++) {
            [oneColumnList addObject:[NSString stringWithFormat:@"%i m", j]];
        }
        for (int j = 0; j < 100; j++) {
            [secondColumnList addObject:[NSString stringWithFormat:@"%i cm", j]];
        }
    }
    pickerAction = [[UIActionSheet alloc] initWithTitle:nil
                                              delegate:nil
                                     cancelButtonTitle:nil
                                destructiveButtonTitle:nil
                                     otherButtonTitles:nil];
    
    
    
    [pickerAction setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    
    CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
    
    myPickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
    
    myPickerView.showsSelectionIndicator = YES;
    myPickerView.dataSource = self;
    myPickerView.delegate = self;
    
    [pickerAction addSubview:myPickerView];
    
    UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"OK"]];
    closeButton.momentary = YES;
    closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
    closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
    closeButton.tintColor = [UIColor blackColor];
    [closeButton addTarget:self action:@selector(dismissActionSheet:) forControlEvents:UIControlEventValueChanged];
    [pickerAction addSubview:closeButton];
    
    
    [pickerAction showInView:[[UIApplication sharedApplication] keyWindow]];
    
    [pickerAction setBounds:CGRectMake(0, 0, 320, 485)];
    
    NSString* value = textFieldPicker.text;
    if (value.length == 0) {
        if (row == 0) {
            value = @"55 Kg";
        }else{
            value = @"1,50 m";
        }
    }
    
    value = [value stringByReplacingOccurrencesOfString:@" Kg" withString:@""];
    value = [value stringByReplacingOccurrencesOfString:@" m" withString:@""];
    NSArray *arr=[value componentsSeparatedByString:@","];
    int i1 = 0;
    int i2 = 0;
    if([arr count] > 0){
        NSString* v1 = [arr objectAtIndex:0];
        i1 = [v1 intValue];
        if([arr count] > 1){
            NSString* v2 = [arr objectAtIndex:1];
            i2 = [v2 intValue];
        }
    }
    
    [myPickerView selectRow:i1-1 inComponent:0 animated:YES];
    [myPickerView selectRow:i2 inComponent:1 animated:YES];
    
    
}

- (void) dismissActionSheet:(id)sender{
    NSInteger row1 =  [myPickerView selectedRowInComponent:0];
    NSInteger row2 =  [myPickerView selectedRowInComponent:1];
    
    NSString* v1 = [oneColumnList objectAtIndex:row1];
    NSString* v2 = @"";
    if (row2>0) {
        v2 =  [secondColumnList objectAtIndex:row2];
    }
    
    NSRange range= [v1 rangeOfString:@"kg"];
    
    if (range.location == NSNotFound) {
        NSInteger v = row1+1;
        NSInteger x = v2.length-3;
        NSInteger y = 0;
       if (row2>0) {
         y = [[v2 substringToIndex:x]intValue];
       }
        atleta.altura = [[NSString stringWithFormat:@"%i.%i", v , y] doubleValue];
        
        int frac = [self getFranctionaNumber:atleta.altura];
        int digit =2;
        if (frac==0) {
            digit = 0;
        }
        
        textFieldPicker.text = [NSString stringWithFormat:@"%@ m",[self numberToFormatter:atleta.altura andDigit:digit]];
    }else{
        NSInteger v = row1+1;
        NSInteger l = v2.length-2;
        NSInteger y = 0;
        if (row2>0) {
            y = [[v2 substringToIndex:l]intValue];
        }
        atleta.peso = [[NSString stringWithFormat:@"%i.%i", v , y] doubleValue];
        int frac = [self getFranctionaNumber:atleta.peso];
        int digit =1;
        if (frac==0) {
            digit = 0;
        }
        textFieldPicker.text = [NSString stringWithFormat:@"%@ Kg",[self numberToFormatter:atleta.peso andDigit:digit]];
    }
    
    [atletaService update:atleta];
    double imc = [self calculaIMCWithPeso:atleta.peso andAltura:atleta.altura];
    
    AtletaCell* cell = (AtletaCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]];
    
    
    cell.textField.text = [NSString stringWithFormat:@"%@ %@",[self numberToFormatter:imc andDigit:2], [self getDescIMC:imc]];
    
    [pickerAction dismissWithClickedButtonIndex:0 animated:YES];
}

- (NSString*) getDescIMC:(double)imc{
    NSString *textImc = @"";
    if (imc < 18.5){
        textImc= @"Baixo";
    }else if ( imc <24.9){
        textImc = @"Ideal";
    }else if ( imc < 29.9){
        textImc = @"Obesidade Leve";
    }else if ( imc < 39.9){
        textImc = @"Obes. Moderada";
    }else{
        textImc = @"Obes. Severa";
    }
    return textImc;
}
@end
