//
//  CustomPickerView.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 30/03/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "CustomPickerView.h"

@implementation CustomPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated{
    [super selectRow:row inComponent:component animated:animated];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
