//
//  hlmTime.m
//  hlmTime
//
//  Created by Artur Hellmann on 30.09.13.
//  Copyright (c) 2013 Hellmann. All rights reserved.
//

#import "hlmTime.h"
#import <math.h>

@interface hlmTime()
/******************
 Private Funktionen
 ******************/
-(void)setTimeFromValues:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds milliseconds:(NSInteger)milliseconds;
-(NSInteger)getComponentsWithLevel:(NSInteger)level;
-(void)setValue:(NSInteger)value byLevel:(NSInteger)level;
/**************************
 ENDE!!! Private Funktionen
 ***************************/
@end

@implementation hlmTime
{
    @private
    NSInteger milliseconds;
}
/***************
 Initialisatoren
 ***************/
-(id)init
{
    if (self = [super init]) {
        NSDate *date = [[NSDate alloc] init];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *components = [calendar components:NSHourCalendarUnit + NSMinuteCalendarUnit + NSSecondCalendarUnit fromDate:date];
        [self setTimeFromValues:[components hour] minutes:[components minute] seconds:[components second] milliseconds:0];
    }
    return self;
}
-(id)initWithHours:(NSInteger)hours
{
    if (self = [super init]) {
        [self setTimeFromValues:hours minutes:0 seconds:0 milliseconds:0];
    }
    return self;
}
-(id)initWithHours:(NSInteger)hours minutes:(NSInteger)minutes
{
    if (self = [super init]) {
        [self setTimeFromValues:hours minutes:minutes seconds:0 milliseconds:0];
    }
    return self;
}
-(id)initWithHours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds
{
    if (self = [super init]) {
        [self setTimeFromValues:hours minutes:minutes seconds:seconds milliseconds:0];
    }
    return self;
}
-(id)initWithHours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds milliseconds:(NSInteger)mseconds
{
    if (self = [super init]) {
        [self setTimeFromValues:hours minutes:minutes seconds:seconds milliseconds:mseconds];
    }
    return self;
}
-(id)initWithFullMilliseconds:(NSInteger)mseconds
{
    if (self = [super init]) {
        milliseconds = mseconds;
    }
    return self;
}
/***********************
 ENDE!!! Initialisatoren
 ***********************/

/****************
 Getter u. Setter
 *****************/
/*Getter:*/
-(NSInteger)getMilliseconds
{
    return [self getComponentsWithLevel:2];
}
-(NSInteger)getSeconds
{
    return [self getComponentsWithLevel:4];
}
-(NSInteger)getMinutes
{
    return [self getComponentsWithLevel:6];
}
-(NSInteger)getHours
{
    return [self getComponentsWithLevel:8];
}
-(NSInteger)getFullMilliseconds
{
    return [self getComponentsWithLevel:1];
}
-(NSInteger)getFullSeconds
{
    return [self getComponentsWithLevel:3];
}
-(NSInteger)getFullMinutes
{
    return [self getComponentsWithLevel:5];
}
-(NSInteger)getFullHours
{
    return [self getComponentsWithLevel:7];
}
-(NSInteger)getOverflows
{
    return [self getComponentsWithLevel:9];
}

/*Setter:*/
-(void)setMilliseconds:(NSInteger)mseconds
{
    if (mseconds > 999) {
        mseconds = 999;
    }
    [self setValue:mseconds byLevel:2];
}
-(void)setSeconds:(NSInteger)seconds
{
    if (seconds > 59) {
        seconds = 59;
    }
    [self setValue:seconds byLevel:4];
}
-(void)setMinutes:(NSInteger)minutes
{
    if (minutes > 59) {
        minutes = 59;
    }
    [self setValue:minutes byLevel:6];
}
-(void)setHours:(NSInteger)hours
{
    if (hours > 23) {
        hours = 23;
    }
    [self setValue:hours byLevel:8];
}
-(void)setFullMilliseconds:(NSInteger)mseconds
{
    milliseconds = mseconds;
}
/************************
 ENDE!!! Getter u. Setter
 ************************/

/****************
 Rechenoperatoren
 ****************/
-(id)addValue:(NSInteger)value
{
    milliseconds = milliseconds + value;
    return self;
}
-(id)addTime:(hlmTime *)partner
{
    milliseconds = milliseconds + [partner getFullMilliseconds];
    return self;
}
-(id)subtractValue:(NSInteger)value
{
    milliseconds = milliseconds - value;
    if (milliseconds < 0) {
        milliseconds = 0;
    }
    return self;
}
-(id)subtractTime:(hlmTime *)partner
{
    milliseconds = milliseconds - [partner getFullMilliseconds];
    if (milliseconds < 0) {
        milliseconds = 0;
    }
    return self;
}
/************************
 ENDE!!! Rechenoperatoren
 ************************/

/********************
 Vergleichsoperatoren
 ********************/
-(BOOL)isSameAs:(hlmTime *)partner
{
    if (milliseconds == [partner getFullMilliseconds]) {
        return YES;
    } else {
        return NO;
    }
}
-(BOOL)isBiggerThan:(hlmTime *)partner
{
    if (milliseconds > [partner getFullMilliseconds]) {
        return YES;
    } else {
        return NO;
    }
}
-(BOOL)isSmallerThan:(hlmTime *)partner
{
    if (milliseconds < [partner getFullMilliseconds]) {
        return YES;
    } else {
        return NO;
    }
}
/****************************
 ENDE!!! Vergleichsoperatoren
 ****************************/

/******************
 Private Funktionen
 ******************/
-(void)setTimeFromValues:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds milliseconds:(NSInteger)mseconds
{
    milliseconds = hours*60*60*1000 + minutes*60*1000 + seconds*1000 + mseconds;
}
-(NSInteger)getComponentsWithLevel:(NSInteger)level
{
    NSInteger MS = fmod(milliseconds, 1000);
    NSInteger restMS = milliseconds - MS;
    NSInteger seconds = restMS / 1000;
    NSInteger S = fmod(seconds, 60);
    NSInteger restS = seconds - S;
    NSInteger minutes = restS / 60;
    NSInteger M = fmod(minutes, 60);
    NSInteger restM = minutes - M;
    NSInteger hours = restM / 60;
    NSInteger H = fmod(hours, 24);
    NSInteger restH = hours - H;
    NSInteger O = restH / 24;
    
    NSInteger result = 0;
    
    switch (level) {
        case 1:
            result = milliseconds;
            break;
        case 2:
            result = MS;
            break;
        case 3:
            result = seconds;
            break;
        case 4:
            result = S;
            break;
        case 5:
            result = minutes;
            break;
        case 6:
            result = M;
            break;
        case 7:
            result = hours;
            break;
        case 8:
            result = H;
            break;
        case 9:
            result = O;
            break;
        default:
            break;
    }
    
    return result;
}
-(void)setValue:(NSInteger)value byLevel:(NSInteger)level
{
    NSInteger operator = 1;
    switch (level) {
        case 4:
            operator = 1000;
            break;
        case 6:
            operator = 1000 * 60;
            break;
        case 8:
            operator = 1000 * 60 * 60;
            break;
        default:
            break;
    }
    NSInteger curr = [self getComponentsWithLevel:level];
    milliseconds = milliseconds - curr * operator + value * operator;
}
/**************************
 ENDE!!! Private Funktionen
 ***************************/
@end
