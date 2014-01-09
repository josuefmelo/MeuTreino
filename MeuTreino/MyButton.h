//
//  MyButton.h
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 18/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyButton : UIButton{
    BOOL isChecked;
}
@property (nonatomic)int rowIndex;
@property (nonatomic) BOOL isChecked;

-(void) checked;
-(void) unchecked;

@end
