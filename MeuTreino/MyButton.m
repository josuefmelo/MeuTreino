//
//  MyButton.m
//  MeuTreino
//
//  Created by Josue Ferreira de Melo on 18/04/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

@synthesize isChecked;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)checked{
    isChecked = YES;
}

-(void)unchecked{
    isChecked = NO;
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
