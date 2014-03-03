// import everything necessary to make sound.
import ddf.minim.*;
import ddf.minim.ugens.*;

// create all of the variables that will need to be accessed in
// more than one methods (setup(), draw(), stop()).
Minim minim;
AudioOutput out;

String[] metamorphosis;
int counter = 1509;
String delimiters = " ,.?!;:[]";
boolean saveMe = false;

// the Oscil we use for modulating frequency.
Oscil fm;

void setup()
{
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

  // initialize the minim and out objects
  minim = new Minim( this );
  out   = minim.getLineOut();
  
  out.playNote ( 0, 1.5, 440 );
  
  /*
  // arguments are frequency, amplitude, and waveform
  Oscil wave = new Oscil( 200, 0.8, Waves.TRIANGLE );

  fm   = new Oscil( 10, 2, Waves.SINE );
  // set the offset of fm so that it generates values centered around 200 Hz
  fm.offset.setLastValue( 200 );
  // patch it to the frequency of wave so it controls it
  fm.patch( wave.frequency );
  // and patch wave to the output
  wave.patch( out );
  */
}

void draw()
{
  if (keyPressed && key == 's') {
    saveFrame("frame-######.png");
    saveMe = false;
  }
  
  
  
  background( 255 );
  stroke( 0 );
  
  String theword = metamorphosis[counter];
  
  int total = 0;
  int wordLength = 0;
  for (int i = 0; i < metamorphosis.length; i ++ ) {
    if (theword.equals(metamorphosis[i])) {
      total++;
    }
    wordLength = theword.length();
  }
  
  /*
  // draw the waveforms
  for( int i = 0; i < out.bufferSize() - 1; i++ )
  {
    // find the x position of each buffer value
    float x1  =  map( i, 0, out.bufferSize(), 0, width );
    float x2  =  map( i+1, 0, out.bufferSize(), 0, width );
    // draw a line from one buffer position to the next for both channels
    line( x1, 100 + out.left.get(i)*50, x2, 100 + out.left.get(i+1)*50);
    line( x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }  
  */
  counter = (counter + 1) % metamorphosis.length;
  
  float modulateAmount = map( total, 0, 11000, 220, 1 );
  float modulateFrequency = map( wordLength, 0, 20, 0.1, 100 );
  
  fm.frequency.setLastValue( modulateFrequency );
  fm.amplitude.setLastValue( modulateAmount );
  
  println(total + ", " + wordLength);
}
