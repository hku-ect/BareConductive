> [!CAUTION]
> **The Bare Conductive Board is now (as of March 5, 2025) no longer active and available. See: https://www.bareconductive.com/
> The instructions written down here are still valid, but it is no longer possible to buy new boards from Bare Conductive.**

# Bare Conductive
In this Github repository you can find files and instructions about how to use the BareConductive with Isadora & Processing. We will prepare the BareConductive Board with an Arduino sketch that will send the sensor data via the usb cable to the computer to be used in Isadora & Procesing.

| :memo:        | This guide assumes you are working with an new BareConductive that has not been used with a computer before.       |
|---------------|:---------------------------------------------|

## How to connect Bare Conductive board to ISADORA:

To use the Bareconductive touchborad with Isadora we need to take a couple of steps:

1. Install the Arduino IDE
2. On Windows, install the touchboard driver
3. Install the Touch Board Arduino Plugin
4. Upload the "Datastream.ino" to the touchboard
5. Open bareConductiveDemo.izz in Isadora

## 1. Install the Arduino IDE
First, download the Legacy Arduino IDE (1.8.X) Arduino IDE from the [Arduino website](https://www.arduino.cc/en/Main/Software). The Touch Board does not work with Arduino IDE 2.X.X. Once you've downloaded the Arduino IDE, please save it to your Applications folder on macOS or run the installer on Windows. The Touch Board doesn't work with the Arduino web editor.

Please note that for Windows, the Arduino IDE needs to be installed from the Arduino Website and not from the Windows App Store.

Open the Arduino IDE once and close it again, creating the necessary Arduino folders in your Documents folder.

## 2. (Windows only) install the touchboard driver
The windows driver can be found in this repositiry in the folder: WindowsDriver

## 3. Install the Touch Board Arduino Plugin
Follow the instructions that can be found in the folder: Touch_Board_Manual_Install
See also this [Youtube video](https://www.youtube.com/watch?v=laDD8L2U4B4)

## 4. Upload the "Datastream.ino" to the touchboard
Now that you have the Arduino IDE set up, you can change the code on the Touch Board! In this example, we're going to show you how to upload "DataStream.ino", this is the code that will send the recieved touch data over the serial port to the connected computer.

* Open the Arduino IDE and select the Arduino file "DataStream.ino" from the repository folder "arduino/DataStream"
* Then, connect your Touch Board to your computer and turn on your board. On Windows, you may see a message pop up telling you that a driver is being installed. Your computer may alert you that the installation has failed, but it will work correctly once the installer is complete. Please wait up to two minutes before proceeding.
* In the Arduino IDE, select the Touch Board from: Tools→Board Additionally, select the board from: Tools→Port
* Search for the ports labeled Bare Conductive Touch Board. There may be several options available on Linux and Mac machines. Choose the one with "CU" in the name. In Windows, there should be one COM port labeled Bare Conductive Touch Board – choose this.
* With the board selected twice, click on the upload button. Please give it up to a minute to upload. When the upload is complete, the Arduino IDE will report "Done uploading." You can also tell by checking the Touch Board. Once the LED stops flashing, the Touch Board has uploaded the code.
* On Windows machines, you may now see another attempt to install a driver, which most likely will appear to fail, and the upload will fail too. Again, please wait up to two minutes and try again. This failure will only happen the first time you reprogram the Touch Board.

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
* [Tutorial 01 Isadora and Arduino](http://art-research2010summer.blogspot.nl/2010/06/tutorial-01-isadora-and-arduino.html)

Using BareConductive Arduino script: “DataStream”: 
* The wayback page of: http://www.bareconductive.com/make/the-touch-board-maxmsp can be found [here](https://web.archive.org/web/20201202163159/https://www.bareconductive.com/make/the-touch-board-maxmsp/)

Change sensitivity of you BAREconductive:
* The wayback page of: http://www.bareconductive.com/make/proximity can be found [here](https://web.archive.org/web/20200925073652/https://www.bareconductive.com/make/proximity/)

# Troubleshooting

### Windows
When Isadora cannot find the BareConductive because the COM port number is higher then ten you will probably need to delete unused comports that are stuck in Windows. See the folowwing two links on how to do that:
* [How do I delete the unused COM ports in Windows 7? ](https://answers.microsoft.com/en-us/windows/forum/windows_7-hardware/how-do-i-delete-the-unused-com-ports-in-windows-7/4bb72733-1be0-4168-9ba5-68dcb72d31d9)
* [How do I clean up COM ports in use?](https://superuser.com/questions/408976/how-do-i-clean-up-com-ports-in-use)




