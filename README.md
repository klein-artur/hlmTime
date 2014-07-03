# hlmTime

## About
With this class you can create time objects, calculate with them and compare them. It makes the handling with
time values very very easy.



### Installation:

1. Copy the two files (hlmTime.h and hlmTime.m) in your project
1. After importing the header, you are able to use the time class.
 
 
You have many possibilitys to initiate a time:

<pre>

testTime = [[hlmTime alloc] init];
    
// Initialized with 2:56:20:316:
testTime1 = [[hlmTime alloc] initWithFullMilliseconds:16880000];
    
    
// Initialized with 2 hours, minutes and seconds and so on... you know...:
testTime2 = [[hlmTime alloc] initWithHours:2];

testTime3 = [[hlmTime alloc] initWithHours:2 minutes:56];

testTime4 = [[hlmTime alloc] initWithHours:2 minutes:56 seconds:20];

testTime5 = [[hlmTime alloc] initWithHours:2 minutes:56 seconds:20 milliseconds:316];

</pre>

Once you have initalized your object, you have the following getter:

<pre>

// This returns the value of the part of the time. So if you have a Time of 2:56:20:316, getMinutes will
// return a NSInteger of 56. And so on... you know...
-(NSInteger)getMilliseconds;

-(NSInteger)getSeconds;

-(NSInteger)getMinutes;

-(NSInteger)getHours;


// This returns the full amount of value of the part. So if you have the time 2:56:20:316, getFullMinutes
// will return a NSInteger of 176. And so on... you know...
-(NSInteger)getFullMilliseconds;

-(NSInteger)getFullSeconds;

-(NSInteger)getFullMinutes;

-(NSInteger)getFullHours;


// This returns the overflow. It means the amount of times, the time value has reached the 24 hours border.
// It is not the same as the day. Ok, it shows the same value, but it is not that meaning. If you would 
// initialize a object with 26 hours, the overflow will give you the value 1. The fullHours will give you
// 26 instead of (as it would be if overflow would be the days) 2.
-(NSInteger)getOverflows;

</pre>


After you give the object its time, you can calculate with them:

</pre>

<pre>

// You have to know:
// the functions compute the values of the actual object and they give the instance as return value, too. 

// add and subtract a value as milliseconds to the time object. 
-(id)addValue:(NSInteger)value;

-(id)subtractValue:(NSInteger)value;


// add and subtract an other time object to the time object
-(id)addTime:(hlmTime *)partner;

-(id)subtractTime:(hlmTime *)partner;

</pre>


And finaly, after all the subjects you have done with your time object, you can compare your time with
Other times:

<pre>

// I think you know what I want to say :)

-(BOOL)isSameAs:(hlmTime *)partner;

-(BOOL)isBiggerThan:(hlmTime *)partner;

-(BOOL)isSmallerThan:(hlmTime *)partner;

</pre>



### Created by:
[Artur Hellmann](http://www.it-hellmann.de)  

### License
The MIT License (MIT)
Copyright (c) 2014 Artur Hellmann

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

###  Release Notes (v1.0.0):
- First commit! Have fun :)
