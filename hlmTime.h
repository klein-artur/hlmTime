//
//  hlmTime.h
//  hlmTime
//
//  Created by Artur Hellmann on 30.09.13.
//  Copyright (c) 2013 Hellmann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface hlmTime : NSObject

/***************
 Initialisatoren
 ***************/

/**Initialisiert das Objekt.
 *@return Gibt das initialisierte Objekt zurück.
 */
-(id)init;

/**Initialisiert das Objekt mit den übergebenen Werten. Alle anderen Werte bleiben bei 0.
 *@param hours Die Stunden die eingetragen werden sollen.
 *@return Gibt das initialisierte Objekt zurück.
*/
-(id)initWithHours:(NSInteger)hours;

/**Initialisiert das Objekt mit den übergebenen Werten. Alle anderen Werte bleiben bei 0.
 *@param hours Die Stunden die eingetragen werden sollen.
 *@param minutes Die Minuten die eingetragen werden sollen.
 *@return Gibt das initialisierte Objekt zurück.
 */
-(id)initWithHours:(NSInteger)hours minutes:(NSInteger)minutes;

/**Initialisiert das Objekt mit den übergebenen Werten. Alle anderen Werte bleiben bei 0.
 *@param hours Die Stunden die eingetragen werden sollen.
 *@param minutes Die Minuten die eingetragen werden sollen.
 *@param seconds Die Sekunden die eingetragen werden sollen.
 *@return Gibt das initialisierte Objekt zurück.
 */
-(id)initWithHours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds;

/**Initialisiert das Objekt mit den übergebenen Werten.
 *@param hours Die Stunden die eingetragen werden sollen.
 *@param minutes Die Minuten die eingetragen werden sollen.
 *@param seconds Die Sekunden die eingetragen werden sollen.
 *@param mseconds die Millisekunden die eingetragen werden sollen.
 *@return Gibt das initialisierte Objekt zurück.
 */
-(id)initWithHours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds milliseconds:(NSInteger)mseconds;

/**Initialisiert das Objekt mit den übergebenen Millisekunden.
 *@param mseconds Die Millisekunden für den Zeitwert, den das Objekt annehmen soll.
 *@return Gibt das initialisierte Objekt zurück.
 */
-(id)initWithFullMilliseconds:(NSInteger)mseconds;

/***********************
 ENDE!!! Initialisatoren
 ***********************/


/****************
 Getter u. Setter
*****************/
/*Getter:*/

/**Getter für Millisekunden.
 *@return Gibt die Millisekunden zurück.
 */
-(NSInteger)getMilliseconds;

/**Getter für Sekunden.
 *@return Gibt die Sekunden zurück.
 */
-(NSInteger)getSeconds;

/**Getter für Minuten.
 *@return Gibt die Minuten zurück.
 */
-(NSInteger)getMinutes;

/**Getter für Stunden.
 *@return Gibt die Stunden zurück.
 */
-(NSInteger)getHours;

/**Getter für die vollen Millisekunden.
 *@return Gibt die Millisekunden zurück.
 */
-(NSInteger)getFullMilliseconds;

/**Getter für die vollen Sekunden.
 *@return Gibt die Sekunden zurück.
 */
-(NSInteger)getFullSeconds;

/**Getter für die vollen Minuten.
 *@return Gibt die Minuten zurück.
 */
-(NSInteger)getFullMinutes;

/**Getter für die vollen Stunden.
 *@return Gibt die Stunden zurück.
 */
-(NSInteger)getFullHours;

/**Getter für die Overflows.
 *@return Gibt die Overflows zurück. Ein Overflow beschreibt wie oft der Zeitwert die 24 Stundengrenze überschritten hat.
 */
-(NSInteger)getOverflows;

/*Setter:*/

/**Setter für die Millisekunden.
 *@param mseconds Die Millisekunden die eingetragen werden sollen.
 */
-(void)setMilliseconds:(NSInteger)mseconds;

/**Setter für die Sekunden.
 *@param seconds Die Sekunden die eingetragen werden sollen.
 */
-(void)setSeconds:(NSInteger)seconds;

/**Setter für die Minuten.
 *@param minutes Die Minuten die eingetragen werden sollen.
 */
-(void)setMinutes:(NSInteger)minutes;

/**Setter für die Millisekunden.
 *@param hours Die Stunden die eingetragen werden sollen.
 */
-(void)setHours:(NSInteger)hours;

/**Setter für die vollen Millisekunden.
 *@param mseconds Die vollen Millisekunden die eingetragen werden sollen.
 */
-(void)setFullMilliseconds:(NSInteger)milliseconds;

/************************
 ENDE!!! Getter u. Setter
 ************************/


/****************
 Rechenoperatoren
 ****************/

/**Rechenoperator zum Addieren von Millisekunden.
 *@param value Die Millisekunden die addiert werden sollen.
 *@return id Gibt das Objekt (self) zurück.
 */
-(id)addValue:(NSInteger)value;

/**Rechenoperator zum Addieren eines anderen Zeitintervals.
 *@param partner Das Zeitinterval, das addiert werden soll als Objekt vom Typ hlmTime.
 *@return id Gibt das Objekt (self) zurück.
 */
-(id)addTime:(hlmTime *)partner;

/**Rechenoperator zum Subtrahieren von Millisekunden.
 *@param value Die Millisekunden die subtrahiert werden sollen.
 *@return id Gibt das Objekt (self) zurück.
 */
-(id)subtractValue:(NSInteger)value;

/**Rechenoperator zum Subtrahieren eines anderen Zeitintervals.
 *@param partner Das Zeitinterval, das subtrahiert werden soll als Objekt vom Typ hlmTime.
 *@return id Gibt das Objekt (self) zurück.
 */
-(id)subtractTime:(hlmTime *)partner;

/************************
 ENDE!!! Rechenoperatoren
 ************************/


/********************
 Vergleichsoperatoren
 ********************/

/**
 *Vergleicht, ob das Objekt (self) genauso groß ist wie das übergebene Objekt (partner).
 *@param partner Das Zeitinterval mit dem verglichen werden soll als Objekt vom Typ hlmTime
 *@return BOOL True wenn das Objekt gleich ist, false wenn nicht.
 */
 -(BOOL)isSameAs:(hlmTime *)partner;

/**
 *Vergleicht, ob das Objekt (self) größer ist als das übergebene Objekt (partner).
 *@param partner Das Zeitinterval mit dem verglichen werden soll als Objekt vom Typ hlmTime
 *@return BOOL True wenn das Objekt größer ist, false wenn nicht.
 */
-(BOOL)isBiggerThan:(hlmTime *)partner;

/**
 *Vergleicht, ob das Objekt (self) kleiner ist als das übergebene Objekt (partner).
 *@param partner Das Zeitinterval mit dem verglichen werden soll als Objekt vom Typ hlmTime
 *@return BOOL True wenn das Objekt kleiner ist, false wenn nicht.
 */
-(BOOL)isSmallerThan:(hlmTime *)partner;
/****************************
 ENDE!!! Vergleichsoperatoren
 ****************************/


/******************
 Private Funktionen
 ******************/
/*

Die Privaten Funktionen sind in dem privaten Interface deklariert.
 
*/
/**************************
 ENDE!!! Private Funktionen
***************************/

@end
