# BareConductive
BareConductive use with Isadora 

BAREconductive information

Instal driver  (for windows)
https://github.com/BareConductive/touch-board-driver

The Master Introduction workshop uses Bare Conductive capacitive sensor as input (http://www.bareconductive.com).
Here you can read how we use the Bare Conductive in combination with Isadora. We directly read the data from the Bare Conductive board  into Isadora.

How to Bare Conductive → ISADORA:

To use the Bare Conductive it is recommanded to install http://arduino.cc Arduino IDE (Integrated Development Environment)


Also you need to Download the Touch Board Arduino Plugin Installer (step 3) http://www.bareconductive.com/make/setting-up-arduino-with-your-touch-board/ 

You need to upload the 'DataStream' code to your Bare Conductive board http://www.bareconductive.com/make/the-touch-board-maxmsp 

How to parse serial data to isadora
Isadora arduino tutorials/forum posts:
http://art-research2010summer.blogspot.nl/2010/06/tutorial-01-isadora-and-arduino.html 
http://forum.troikatronix.com/forum/Isadora_C2/User_Patches%2C_Tips_%26_Tricks_F7/Arduino_and_servos_from_isadora_P82/
http://troikatronix.com/troikatronixforum/discussion/159/arduino-isadora/p1

In Isadora use “Serial In watcher text” with decoding parameters:

```
"FDAT: "
value1 : integer = 3 digits
value2 : integer = 3 digits
value3 : integer = 3 digits
value4 : integer = 3 digits
value5 : integer = 3 digits
value6 : integer = 3 digits
value7 : integer = 3 digits
value8 : integer = 3 digits
value9 : integer = 3 digits
value10 : integer = 3 digits
value11 : integer = 3 digits
value12 : integer = 3 digits
value13 : integer = 3 digits
```

Using BareConductive Arduino script: “DataStream” 
“The DataStream code is an example within our MPR121 Library. Find it by navigating to File/ Examples/ MPR121/ Examples/ DataStream. ”
http://www.bareconductive.com/make/the-touch-board-maxmsp 


Change sensitivity of you BAREconductive:
http://www.bareconductive.com/make/proximity




