/*******************************************************************************

 Bare Conductive MPR121 output grapher / debug plotter for TouchBoard and Pi Cap
 -------------------------------------------------------------------------------

 GUIhelpers.pde - helper functions for mpr121_grapher.pde

 Bare Conductive code written by Stefan Dzisiewski-Smith and Szymon Kaliski.

 This work is licensed under a MIT license https://opensource.org/licenses/MIT
 
 Copyright (c) 2016, Bare Conductive
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

*******************************************************************************/

void customiseSL(ScrollableList sl) {
  // a convenience function to customize a DropdownList
  sl.setBackgroundColor(color(190));
  sl.setItemHeight(20);
  sl.setBarHeight(20);
  sl.getCaptionLabel().set("dropdown");
  sl.setColorBackground(color(60));
  sl.setColorActive(color(255, 128));
  sl.setSize(210,100);
}

void setupLabels() {
  labels = new Textlabel[numFooterLabels + numVerticalDivisions + 1];

  String footerLabels[] = { "FILTERED DATA", "BASELINE DATA", "TOUCHED LEVEL", "RELEASED LEVEL", "TOUCH EVENT", "RELEASE EVENT" };
  int footerColours[]   = { filteredColour, baselineColour, touchedColour, releasedColour, touchColour, releaseColour };

  for (int i = 0; i < numVerticalDivisions + 1; i++) {
    labels[i] = cp5
      .addTextlabel(String.valueOf(tenBits - (i * tenBits / numVerticalDivisions)))
      .setText(String.valueOf(tenBits - (i * tenBits / numVerticalDivisions)))
      .setPosition(graphsLeft, graphsTop + i * (graphsHeight / numVerticalDivisions) - 10)
      .setColorValue(textColour);

    labels[i].hide();
  }

  for (int i = 0; i < numFooterLabels; i++) {
    labels[i + numVerticalDivisions + 1] = cp5
      .addTextlabel(footerLabels[i])
      .setText(footerLabels[i])
      .setPosition(graphFooterLeft + 200 + 100 * i, graphFooterTop)
      .setColorValue(footerColours[i]);

    labels[i + numVerticalDivisions + 1].hide();
  }

  pausedIndicator = cp5
    .addTextlabel("pausedIndicator")
    .setText("PAUSED")
    .setPosition(965, graphFooterTop)
    .setColorValue(color(255, 0, 0, 200))
    .setVisible(false);
}

void setupRunGUI() {
  electrodeSelector = cp5.addScrollableList("electrodeSel").setPosition(graphsLeft + graphsWidth - 296, 75);
  electrodeSelector.hide();
  customiseSL(electrodeSelector);
  electrodeSelector.getCaptionLabel().set("electrode number");
  for (int i = 0; i < numElectrodes; i++) {
    electrodeSelector.addItem("electrode " + i, i);
  }
  electrodeSelector.setValue(electrodeNumber);

  instructions = cp5
    .addTextlabel("pauseInstructions")
    .setText("PRESS P TO PAUSE, PRESS IT AGAIN TO RESUME\nPRESS D TO DUMP DATA\nPRESS S TO SEE JUST FILTERED DATA (SOLO MODE)")
    .setPosition(graphsLeft+graphsWidth-300,40)
    .setColorValue(textColour);

  instructions.hide();
}

void setupStartPrompt(){
  startPrompt = cp5
    .addTextlabel("startPromptLabel")
    .setText("SELECT THE SERIAL PORT THAT YOUR BARE CONDUCTIVE TOUCH BOARD IS CONNECTED TO, OR CHOOSE OSC SO WE CAN BEGIN:")
    .setPosition(100, 100)
    .setColorValue(textColour) ;

  serialSelector = cp5.addScrollableList("serialSel").setPosition(103, 150);
  customiseSL(serialSelector);
  serialSelector.getCaptionLabel().set("serial port");

  for (int i = 0; i < validSerialList.length; i++) {
    serialSelector.addItem(validSerialList[i], i);
  }
  
  serialSelector.close();

  oscButton = cp5
    .addButton("oscButton")
    .setCaptionLabel("OSC")
    .setColorBackground(color(60))
    .setPosition(530, 150)
    .setSize(120, 20);
}

void disableStartPrompt(){
  startPrompt.hide();
  serialSelector.hide();
  oscButton.hide();
}

void enableRunGUI() {
  electrodeSelector.show();
  instructions.show();

  for (int i = 0; i < numFooterLabels + numVerticalDivisions + 1; i++) {
    labels[i].show();
  }
}