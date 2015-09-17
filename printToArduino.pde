//send to arduino
void printToArduino(int m1, int m2, int m3, int m4, int s1, int s2, int s3, int s4) {
  if (!commsError) {
    
    println('T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2) + hex(s3,2) + hex(s3,2) + hex(s4,2)); //debug
    port.write('T' + hex(m1,2) + hex(m2,2) + hex(m3,2) + hex(m4,2) + hex(s1,2) + hex(s3,2) + hex(s3,2) + hex(s4,2));
  }
}
