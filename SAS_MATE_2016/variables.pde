//procontroll variables
ControllIO controll;
ControllDevice device;
Serial port;

//joystick variables
ControllSlider sliderX;
ControllSlider sliderZ;

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

float x, y, z, sensitivity;

long lastSend;

PFont font;

int width = 1200;
int height = 600;

boolean jsError = true;
boolean commsError = true;


