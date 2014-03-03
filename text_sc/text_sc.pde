//import libraries
import supercollider.*;
import oscP5.*;
import netP5.*;

Synth synth;

PFont f;              // A variable to hold onto a font
String[] kinglear;    // The array to hold all of the text
int counter = 1509;   // Where are we in the text (start later b/c Project Gutenberg has licensing info at beginning)

// We will use spaces and punctuation as delimiters
String delimiters = " ,.?!;:[]";

void setup() {
  size(662, 300);
  
  // Load the font
  f = loadFont( "Georgia-Bold-16.vlw" );
  
  // Load King Lear into an array of strings
  String url = "http://www.gutenberg.org/files/5200/5200.txt";
  String[] rawtext = loadStrings(url);
  
  // Join the big array together as one long string
  String everything = join(rawtext, "" );
  
  // All the lines in King Lear are first joined as one big String and then split up into an array of individual words. 
  // Note the use of splitTokens() since we are using spaces and punctuation marks all as delimiters.  
  kinglear = splitTokens(everything,delimiters);
  //frameRate(5);
  
  // uses default sc server at 127.0.0.1:57110    
    // does NOT create synth!
    synth = new Synth("sine");
    
    // set initial arguments
    synth.set("amp", 0.5);
    synth.set("freq", 80);
    
    // create synth
    synth.create();
}

void draw() {
  background(255);
  
  // Pick one word from King Lear
  String theword = kinglear[counter];
  
  // Count how many times that word appears in King Lear
  int total = 0;
  for (int i = 0; i < kinglear.length; i ++ ) {
    if (theword.equals(kinglear[i])) {
      total ++;
    }
  }
  
  // Display the text and total times the word appears
  textFont(f);
  fill(0);
  text(theword,10,90);
  text(total,10,110);
  stroke(0);
  fill(175);
  rect(10,50,total/4,20);
  
  // Move onto the next word
  counter = (counter + 1) % kinglear.length;
  
  
}

void mouseMoved ()
{
    synth.set("freq", 40 + (mouseX * 3)); 
}

void exit ()
{
    synth.free();
    super.exit();
}
