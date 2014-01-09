//
//  DateUtil.h
//  Fitness
//
//  Created by Josue Ferreira de Melo on 07/02/13.
//  Copyright (c) 2013 josuefmelo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

+ (NSDate*) stringToDate: (NSString *)string;
+ (NSString*) dateToString:(NSDate *)date;
+ (NSString*) timeIntervalToString: (NSTimeInterval)timeInterval;
+ (BOOL) compareGreateWithDate1: (NSDate*)date1 andDate2:(NSDate*)date2;
+ (int) weekFromDate:(NSDate*)theDate;
@end
