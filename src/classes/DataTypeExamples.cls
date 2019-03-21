public class DataTypeExamples {
    /*
     *  /*
// Boolean Example - can be set to true/false/null
Boolean isWeekend;
isWeekend = false;

// Use System.debug() to print to a debug log.
System.debug('isWeekend = ' + isWeekend);


// Date Example - A value that indicates a particular day.
Date myDate = date.newinstance(2019, 3, 5);
SYsTeM.DeBUg('Todays Date: ' + myDate.addDays(5));

// Decimal - A number that includes a decimal point. 
// Currency fields are automatically assigned the type Decimal.
Decimal cost = 19.99;
System.debug('cost = ' + cost);

// Double - A 64-bit number that includes a decimal point.
Double pi = 3.14159;

// Decimal vs Double - You should NEVER use floating point representations (Double)
// to handle monetary calculations, instead use DEcimal.

Double zeroPointZeroOne = 0.01;
Double doubleSum = 0.0;
for (Integer i = 0; i < 10; i++) {
    doubleSum += zeroPointZeroOne;
}

System.debug('doubleSum = ' + doubleSum);


Decimal zeroPointZeroOne = 0.01;
Decimal decimalSum = 0.0;
for (Integer i = 0; i < 10; i++) {
    decimalSum += zeroPointZeroOne;
}

System.debug('decimalSum = ' + decimalSum);

// Integer - A 32-bit number that does not include a decimal.
// Min = -2,147,483,648 & Max = 2,147,483,647
Integer age = 23;

// Long - a 64-bit number that does not include a decimal.
Long distanceInInchesToTheMoon = 15130000000L;

// Object - Any data type that is supported in Apex.
Object obj = 10;
Object obj2 = new Account(Name='Matt');
System.debug('obj: ' + (Integer)obj*2);
System.debug('obj2: ' + obj2);

// String - Any set of characters surrounded by single quotes.
String sentence = 'The quick brown fox jumped over the lazy dog';

// sObject - Any Salesforce object
sObject cc = new Contact();
sObject class1 = new Class__c();
Contact c = new Contact();

c.lastName = 'Ruiz';
System.debug('c.lastName: ' + c.lastName);

 

*/
}