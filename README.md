# BareConductive
How to use the BareConductive with Isadora. 

The Master Introduction workshop uses the Bareconductive capacitive sensor as input (http://www.bareconductive.com).
Here you can read how we use the Bare Conductive in combination with Isadora. We directly read the data from the Bare Conductive board over the serial port into Isadora.

## How to connect Bareconductive touchboard to ISADORA:

To use the Bareconductive touchborad with Isadora we need to take a couple of steps:

1. Install the Arduino IDE
2. On Windows, install the touchboard driver
3. Install the Touch Board Arduino Plugin
4. Upload the "Datastream.ino" to the touchboard
5. Open bareConductiveDemo.izz in Isadora

## 1. Install the Arduino IDE
To instal the Arduino IDE (Integrated Development Environment) go to https://www.arduino.cc/en/Main/Software and download the IDE for you operating system.

## 2. (Windows only) install the touchboard driver
Go to: https://github.com/BareConductive/touch-board-driver and follow the instructions

## 3. Install the Touch Board Arduino Plugin
Go to: http://www.bareconductive.com/make/setting-up-arduino-with-your-touch-board/ and follow the instructions

## 4. Upload the "Datastream.ino" to the touchboard
Get the file from the github, open it in the Arduino IDE and upload it to the Bareconductive

## 5. Open bareConductiveDemo.izz in Isadora
* Get the file from the github, open it in Isadora.
* Go to Communications -> Serial Port Setup
* From the dropdown menu of port 1 choose the right com port (on Windows it will be called COM with a number and on OSX it will be called usbmoden1411 or similar)
* Set the speed to 9600, No Parity, Bits 8
* go to Comunnications -> Enable Serial Ports

After these steps you should see changing values at the BareConductiveFDAT actor.
Try attaching something to the electrodes and see how the numbers change.

The data is sent form the Bareconductive to Isadora over the serial port. Use yhe "Serial In watcher text" to decode the incoming data.
See text below for example of the decoding parameters:

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
# Note on the Data:
The Bareconductive sends different kinds of data over the serial port.   
Start using the "FDAT" data this is the most basic form of data from the Touch Board electrodes. 

FDAT - Basic electrode data
TOUCH - Bnary indication of touch event
BVAL - Baseline electrode data
TTHS - Touch threshold (set in code)
RTHS - Release threshold (set in code)
DIFF - Difference between FDAT & BVAL

# Links:

Isadora arduino tutorials/forum posts:
http://art-research2010summer.blogspot.nl/2010/06/tutorial-01-isadora-and-arduino.html 
http://forum.troikatronix.com/forum/Isadora_C2/User_Patches%2C_Tips_%26_Tricks_F7/Arduino_and_servos_from_isadora_P82/
http://troikatronix.com/troikatronixforum/discussion/159/arduino-isadora/p1

Using BareConductive Arduino script: “DataStream” 
“The DataStream code is an example within our MPR121 Library. Find it by navigating to File/ Examples/ MPR121/ Examples/ DataStream. ”
http://www.bareconductive.com/make/the-touch-board-maxmsp 

Change sensitivity of you BAREconductive:
http://www.bareconductive.com/make/proximity

# Troubleshooting

### Windows
When Isadora cannot find the BareConductive because the COM port number is higher then ten you will probably need to delete unused comports that are stuck in Windows. See the folowwing two links on how to do that:
* https://answers.microsoft.com/en-us/windows/forum/windows_7-hardware/how-do-i-delete-the-unused-com-ports-in-windows-7/4bb72733-1be0-4168-9ba5-68dcb72d31d9
* https://superuser.com/questions/408976/how-do-i-clean-up-com-ports-in-use




