//
//  DateUtil.m
//  Fitness
//
//  Created by Josue Ferreira de Melo on 07/02/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil


+ (NSDate*) stringToDate: (NSString *)string{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    [df setDateFormat:@"dd'/'MM'/'yyyy"];
    return [df dateFromString:string];
}
+ (BOOL) compareGreateWithDate1: (NSDate*)date1 andDate2:(NSDate*)date2{
    if([date1 compare:date2] == NSOrderedDescending){
        return YES;
    }
    return NO;
}
+ (NSString*) timeIntervalToString: (NSTimeInterval)timeInterval{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    [df setDateFormat:@"dd'/'MM'/'yyyy"];
    
    NSString *dateFormated =[NSString stringWithFormat:@"%@", [df stringFromDate:date]];
    
    return dateFormated;
}

+ (NSString*) dateToString:(NSDate *)date{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    [df setDateFormat:@"dd'/'MM'/'yyyy"];
    
    NSString *dateFormated =[NSString stringWithFormat:@"%@", [df stringFromDate:date]];
    
    return dateFormated;
}
+ (int) weekFromDate:(NSDate*)theDate{
    int weekday = [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:theDate] weekday];
    return weekday;

}
@end
