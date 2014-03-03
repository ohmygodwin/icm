import ddf.minim.*;
import ddf.minim.ugens.*;
import java.net.*;
import java.io.*;

AudioPlayer player;

String[] metamorphosis;
int counter = 1509;
String delimiters = " ,.?!;:[]";
boolean saveMe = false;

Minim minim = new Minim( this );
AudioOutput out = minim.getLineOut();

void setup() {
  size( 662, 250, P3D );
  
  //The Metamorphosis
  //String url = "http://www.gutenberg.org/files/5200/5200.txt";
  //Frankenstein
  //String url = "http://www.gutenberg.org/files/84/84.txt";
  //Encyclopedia of Needlework
  String url = "http://www.gutenberg.org/files/20776/20776.txt";
  String[] rawtext = loadStrings(url);
  
  String everything = join(rawtext, "" );
  
  metamorphosis = splitTokens(everything,delimiters);
 
}

void draw() {
  if (keyPressed && key == 's') {
    saveFrame("frame-######.png");
    saveMe = false;
  }
  
  background(255);
  stroke(0);
  
  String theword = metamorphosis[counter];
  
  int total = 0;
  float wordLength = 0;
  for (int i = 0; i < metamorphosis.length; i ++ ) {
    if (theword.equals(metamorphosis[i])) {
      total++;
    }
    wordLength = theword.length();
  }
  
  counter = (counter + 1) % metamorphosis.length;
  
  float time;
  for (time = 0.0; time < 20.0; time = time + 3.0) {
  out.playNote( time, wordLength/10, total );
  
  float total_ = map(total, 0, 1078, 0, height);
  float time_ = map(time, 0, 20.0, 0, width);
  float wordLength_ = map(wordLength, 0, 15, 5, 20);
  
  ellipse(time_, total_, wordLength_, wordLength_);
  delay(100);
  }
  
  println(time + ", " + wordLength + ", " + total);
}



