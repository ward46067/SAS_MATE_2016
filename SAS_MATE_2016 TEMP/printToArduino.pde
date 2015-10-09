void printToArduino() {
  if (connectedArduino) {
    port.write('T' + hexOut());
  }
}

