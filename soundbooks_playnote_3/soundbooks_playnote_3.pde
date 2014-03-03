//GoogleTTS code is adapted from Amnon p5 http://amnonp5.wordpress.com/2011/11/26/text-to-speech/

import controlP5.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
import java.net.*;
import java.io.*;

//sound using Minim - adapted from reference on site
AudioPlayer player;

//GUI using controlp5 - adapted from dropdownlist example
ControlP5 cp5;
DropdownList d1;
CheckBox checkbox;
int cnt = 0;

PFont font;

String[] texttt;
//int counter = 1509;
int counter = 0;
String delimiters = " ,.?!;:[]-";
boolean saveMe = false;

float total_;
float time_;
float wordLength_;
float time;
float wordLength;
String theword;

int last = 0;
int m;
int ellipseCount = 0;
int countWord = 0;

boolean playVoice = false;
boolean playTone = false;

String s;

///////////////////////////////////////////////////////////////////////
///////////////////////          TEXTS          ////////////////////////
///////////////////////////////////////////////////////////////////////
  
  String text1 = "the-metamorphosis.txt";   //The Metamorphosis
  String text2 = "frankenstein.txt";   //Frankenstein
  String text3 = "encyclopedia-of-needlework.txt";   //Encyclopedia of Needlework
  String text4 = "moby-dick.txt";   //Moby-Dick
  String text5 = "siddhartha.txt";   //Siddhartha
  String text6 = "war-and-peace.txt";   //War and Peace
  String text7 = "heart-of-darkness.txt";   //Heart of Darkness
  String text8 = "the-republic.txt";   //The Republic
  String text9 = "a-modest-proposal.txt";   //A Modest Proposal
  String text10 = "preludes-eliot.txt";   //Preludes
  String text11 = "little-white-lily-macdonald.txt";   //Little White Lily
  String text12 = "makeup.txt";   //Makeup
  String text13 = "etiquette.txt";   //Etiquette
  String text14 = "i-saw-myself-lew-welch.txt";   //[I Saw Myself]

String url = "blank.txt";

Minim minim = new Minim( this );
AudioOutput out = minim.getLineOut();

///////////////////////////////////////////////////////////////////////
///////////////////////          SETUP          ////////////////////////
///////////////////////////////////////////////////////////////////////

void setup() {
  size( 1200, 800, P3D );
  background(255);
    
  String[] rawtext = loadStrings(url);
  String everything = join(rawtext, "" ).toLowerCase();
  texttt = splitTokens(everything, delimiters);
  
///////////////////////////////////////////////////////////////////////
///////////////////////          AXES          ////////////////////////
///////////////////////////////////////////////////////////////////////
  
  font = loadFont("Helvetica-14.vlw");
  textFont(font, 14);
  
  stroke(200);
  line(49, 100, 49, height-50);
  line(width-50, height-50, 49, height-50);
  
  textFont(font, 14);
  fill(50);
  textAlign(CENTER);
  text("time", width/2, height-25);
  
  pushMatrix();
  translate(25, height/2);
  rotate(-PI/2);
  text("word frequency | pitch", 0, 0);
  translate(-25, -height/2);
  popMatrix();
  

  
///////////////////////////////////////////////////////////////////////
///////////////////////          DROPDOWN          ////////////////////////
///////////////////////////////////////////////////////////////////////  
  
  cp5 = new ControlP5(this);
  // create a DropdownList
  d1 = cp5.addDropdownList("myList-d1")
          .setPosition(50, 50)
          .setSize(230,230)
          ;
          
  customize(d1); // customize the first list
  d1.setIndex(14);
  
///////////////////////////////////////////////////////////////////////
///////////////////////          CHECKBOXES          ////////////////////////
///////////////////////////////////////////////////////////////////////
  fill(0);
  
  checkbox = cp5.addCheckBox("checkBox")
                .setPosition(400, 20)
                .setColorForeground(color(120))
                .setColorActive(color(200))
                .setColorLabel(color(255))
                .setSize(30, 30)
                .setItemsPerRow(3)
                .setSpacingColumn(30)
                .setSpacingRow(20)
                .addItem("VOICE", 21)
                .addItem("TONE", 20)
                ;
  
}

///////////////////////////////////////////////////////////////////////
///////////////////////          DRAW!!          ////////////////////////
///////////////////////////////////////////////////////////////////////

void draw() {
  
  smooth(8);
  //background(255, 1);
  noStroke();
  fill(255);
  rectMode(CORNER);
  rect(50, 0, 300, 300);
  rect(width-50, 0, 100, height);
  
  m = millis() - last;
  
  if (keyPressed && key == 's') {
    saveFrame("frame-######.png");
    saveMe = false;
  }
  
///////////////////////////////////////////////////////////////////////
///////////////////////          COUNTWORD          ////////////////////////
///////////////////////////////////////////////////////////////////////
  
  theword = texttt[counter];
  
  int total = 0;
  wordLength = 0;
  for (int i = 0; i < texttt.length; i ++ ) {
    if (theword.equals(texttt[i])) {
      total++;
    }
    wordLength = theword.length();
  }
  
  counter = (counter + 1) % texttt.length;
  
///////////////////////////////////////////////////////////////////////
///////////////////////          NOTES          ////////////////////////
///////////////////////////////////////////////////////////////////////  
  
  for (time = 0.0; time < 20.0; time = time + 3.0) {
    delay(100);
    
    float total1 = map(total, 0, 1078, 50, 1200);
    
    if (wordLength < 15 && playTone == true) {
      out.playNote( time, wordLength/10, total1 );
    }
    
    total_ = map(total, 0, 1078, 70, height-200);
    wordLength_ = map(wordLength, 0, 15, 5, 40);
  }
  
  time_ = map(m, 0, 100000.0, 10, width-10);
  
  
  String saveWord[] = new String[5000];
  saveWord[countWord] = theword;
  

///////////////////////////////////////////////////////////////////////
///////////////////////          WORDWRITE          ////////////////////////
///////////////////////////////////////////////////////////////////////

      font = loadFont("Helvetica-14.vlw");
      textFont(font, 24);
      
      fill(255);
      noStroke();
      rectMode(CENTER);
      rect(800, 0, 150, 150);
      
      textFont(font, 14);
      textAlign(CENTER);
      //text(theword, time_+50, height-total_ - 15);
      fill(0);
      text(saveWord[countWord], 800, 50);

///////////////////////////////////////////////////////////////////////
///////////////////////          CIRCLES          /////////////////////
///////////////////////////////////////////////////////////////////////     


Circles[] circles = new Circles[500];

  if (total_ >= 20 && wordLength < 15) {
      circles[ellipseCount] = new Circles(time_+55, height-total_, wordLength_);
  }
  
  for (int i = 0; i <= ellipseCount; i++) {
   circles[i].show(); 
  }
     
     /*
if(dist(mouseX,mouseY,20,20)<10){
    fill(255);
    text(saveWord[countWord] ,mouseX-20,mouseY-10);
  }
*/
     
      //ellipse(time_+53, height-total_, wordLength_, wordLength_);

///////////////////////////////////////////////////////////////////////
///////////////////////          VOICE          /////////////////////
///////////////////////////////////////////////////////////////////////
  
  
  if (playVoice == true && wordLength > 4 && wordLength < 15) {
    s = theword;
    googleTTS(s, "en");
    player = minim.loadFile(s + ".mp3", 2048);
    player.loop(0);
  }
  
  
  //println(theword + ", " + m + ", " + total + ", " + wordLength);
  //println(last + ", " + m);
  countWord++;
  ellipseCount++;
}

///////////////////////////////////////////////////////////////////////
///////////////////////          GOOGLETTS          ////////////////////////
///////////////////////////////////////////////////////////////////////

void googleTTS(String txt, String language) {
  String u = "http://translate.google.com/translate_tts?tl=";
  u = u + language + "&q=" + txt;
  u = u.replace(" ", "%20");
  try {
    URL url = new URL(u);
    try {
      URLConnection connection = url.openConnection();
      connection.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 1.2.30703)");
      connection.connect();
      InputStream is = connection.getInputStream();
      File f = new File(sketchPath + "/" + txt + ".mp3");
      OutputStream out = new FileOutputStream(f);
      byte buf[] = new byte[1024];
      int len;
      while ((len = is.read(buf)) > 0) {
        out.write(buf, 0, len);
      }
      out.close();
      is.close();
      //println("File created: " + txt + ".mp3");
    } catch (IOException e) {
      e.printStackTrace();
    }
  } catch (MalformedURLException e) {
    e.printStackTrace();
  }
}
 
void stop() {
  player.close();
  minim.stop();
  super.stop();
}

///////////////////////////////////////////////////////////////////////
///////////////////////          CONTROLP5          ////////////////////////
///////////////////////////////////////////////////////////////////////

void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(255));
  ddl.setColorActive(color(150));
  ddl.setItemHeight(30);
  ddl.setBarHeight(30);
  ddl.captionLabel().set("Choose a text");
  ddl.captionLabel().style().marginTop = 10;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  
  ddl.addItem("The Metamorphosis, Franz Kafka", 0);
  ddl.addItem("Frankenstein, Mary Shelley", 1);
  ddl.addItem("Encyclopedia of Needlework, Therese de Dillmont", 2);
  ddl.addItem("Moby-Dick, Herman Melville", 3);
  ddl.addItem("Siddhartha, Hermann Hesse", 4);
  ddl.addItem("War and Peace, Leo Tolstoy", 5);
  ddl.addItem("Heart of Darkness, Joseph Conrad", 6);
  ddl.addItem("The Republic, Plato", 7);
  ddl.addItem("A Modest Proposal, Jonathan Swift", 8);
  ddl.addItem("Preludes, t.s. eliot", 9);
  ddl.addItem("Little White Lily, George Macdonald", 10);
  ddl.addItem("Makeup, Dora Malech", 11);
  ddl.addItem("Etiquette, Emily Post", 12);
  ddl.addItem("[I Saw Myself], Lew Welch", 13);
  
  //ddl.scroll(0);
}

void controlEvent(ControlEvent theEvent) {
  
  if (theEvent.isGroup()) {
    //println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  }
  else if (theEvent.isController()) {
    //println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
  
  if (theEvent.getGroup().getValue() == 0) {
    
    url = text1;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 1) {
    url = text2;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 2) {
    url = text3;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 3) {
    url = text4;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 4) {
    url = text5;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 5) {
    url = text6;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 6) {
    url = text7;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 7) {
    url = text8;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 8) {
    url = text9;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 9) {
    url = text10;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 10) {
    url = text11;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 11) {
    url = text12;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 12) {
    url = text13;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  else if (theEvent.getGroup().getValue() == 13) {
    url = text14;
    
    counter = 10;
    countWord = 0;
    ellipseCount = 0;
    last = millis();
    
    String[] rawtext = loadStrings(url);
    String everything = join(rawtext, "" ).toLowerCase();
    texttt = splitTokens(everything, delimiters);
    
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(51, 150, width, 599);
    
  }
  
if (theEvent.isFrom(checkbox)) {
    //print("got an event from "+checkbox.getName()+"\t\n");
    // checkbox uses arrayValue to store the state of 
    // individual checkbox-items. usage:
    //println(checkbox.getArrayValue());
    int col = 0;
    for (int i=0;i<checkbox.getArrayValue().length;i++) {
      int n = (int)checkbox.getArrayValue()[i];
      //print(n);
      if (i == 0 && n == 1) {
        playTone = true;
      }
      else if (i == 1 && n == 1) {
       playVoice = true; 
      }
      
      else if (i == 0 && n == 0) {
        playTone = false;
      }
      else if (i == 1 && n == 0) {
        playVoice = false;
      }
    }
    //println();    
  }
}


