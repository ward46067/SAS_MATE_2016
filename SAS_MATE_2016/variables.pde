//procontroll variables
ControllIO controll;
ControllDevice device;
Serial port;

//joystick variables
ControllSlider sliderX; 
ControllSlider sliderZ;
ControllSlider sliderSensitivity;
ControllSlider sliderRotation;

ControllButton buttonBoost;
ControllButton buttonElevationToggle;

//printer varibles
PrintWriter outputLog;
PrintWriter motor1Log;
PrintWriter motor2Log;
PrintWriter motor3Log;
PrintWriter motor4Log;


double motor1 = 0;
double motor2 = 0;
double motor3 = 0;
double motor4 = 0;

double motor1x = 0;
double motor2x = 0;
double motor3x = 0;
double motor4x = 0;

double motor1z = 0;
double motor2z = 0;
double motor3z = 0;
double motor4z = 0;

double servo1 = 0;
double servo2 = 0;
double servo3 = 0;
double servo4 = 0;

int m1, m2, m3, m4, s1, s2, s3, s4;

float x, y, z, sensitivity, boost, rotation, elevationToggle;

long lastSend;

PFont font;

int width = 1200;
int height = 600;

boolean connectedJoystick = false;
boolean connectedArduino = false;

//xml
XML colorXML;

XML[] colorset;

XML[] primaryChild;
XML[] second1Child;
XML[] second2Child;
XML[] complementChild;

String xmlID;

//xml colors 
int[][] primary = new int[5][3];
int[][] second1 = new int[5][3];
int[][] second2 = new int[5][3];
int[][] complement = new int[5][3];

//colors
int[] colorText = new int[3];

int[] colorBackground = new int[3];

int[] colorBarInfo = new int[3];
int[] colorBarBackground = new int[3];

int[] colorTitleBackground = new int[3];

int[] colorMotorBackground = new int[3];
int[] colorMotorBackgroundSS = new int[3];

int[] colorDebugBackground = new int[3];
int[] colorDebugText = new int[3];

