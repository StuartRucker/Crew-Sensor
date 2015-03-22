import processing.serial.*;

Serial port;  // Create object from Serial class
int val;      // Data received from the serial port

String data;
String[] dataChunks;
int gx = 0;
int gy = 0;
int gz = 0;
int ax = 0;
int ay = 0;
int az = 0;
float aver;
int ave;
int[] numbers;

void setup() 
{
  size(1000, 700);
  
 port = new Serial(this, "/dev/tty.usbmodem1411", 9600);
 port.bufferUntil('\n');
}

void draw()
{
  background(250,250,250);
  fill(46,58,103);
  
  text(ave,50,50);
  text(gx,50,70);
  
  fill(255,0,0);
  rect(0,350,60,gx / 20);
  rect(100,350,60,gy / 20);
  rect(200,350,60,gz / 20);
  rect(300,350,60,ax);
  rect(400,350,60,ay);
  rect(500,350,60,az);
  line(0,350,1000,350);
  aver = (ax * ax) + (ay * ay) + (az * az);
  ave = int(pow(aver, .5));
  rect(600,350,60,ave);

  

  
  
 
}

void serialEvent (Serial port)
{
  
  data = port.readStringUntil('\n');
  
  dataChunks = split(data, ',');
 // numbers = int(dataChunks);
  try{
  gx = int(dataChunks[0]);
  gy = int(dataChunks[1]);
  gz = int(dataChunks[2]);
  ax = int(dataChunks[3]);
  ay = int(dataChunks[4]);
  az = int(dataChunks[5]);
  }catch (Exception e){
  println("Hey, that’s not a valid INTEGER");
}
  
  
  /*gy = int(port.readStringUntil(','));
  gz = int(port.readStringUntil(','));
  ax = int(port.readStringUntil(','));
  ay = int(port.readStringUntil(','));
  az = int(port.readStringUntil(','));*/
}
