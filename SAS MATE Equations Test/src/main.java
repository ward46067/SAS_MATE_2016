
import java.util.Scanner;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author dalen
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
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

        double x, y, z, rot, sens, elv;
        
        Scanner scan = new Scanner(System.in);
        
        System.out.println("Enter an X value.");
        x = scan.nextDouble();
        System.out.println("Enter a Z value.");
        z = scan.nextDouble();
        System.out.println("Enter a Y value.");
        y = scan.nextDouble();
        
        if(y == 0) {
            servo1 = 90;
            servo2 = 90;
            servo3 = 90;
            servo4 = 90;
          }

          if(x == 0) {
            motor1x = 0;
            motor2x = 0;
            motor3x = 0;
            motor4x = 0;
          }

          if(z == 0) {
            motor1z = 0;
            motor2z = 0;
            motor3z = 0;
            motor4z = 0;
          }

          if(x < 0) {
            motor1x = x;
            motor2x = -1 * x;
            motor3x = -1 * x;
            motor4x = x;
            
          }

          if(x > 0) {
            motor1x = x;
            motor2x = -1 * x;
            motor3x = -1 * x;
            motor4x = x;
          }

          if(z > 0) {
            motor1z = -1 * z;
            motor2z = -1 * z;
            motor3z = z;
            motor4z = z;
          }

          if(z < 0) {
            motor1z = -1 * z;
            motor2z = -1 * z;
            motor3z = z;
            motor4z = z;
          }

          motor1 = motor1x + motor1z;
          motor2 = motor2x + motor2z;
          motor3 = motor3x + motor3z;
          motor4 = motor4x + motor4z;

          if(y > 1) {
              
              if(motor1 > 0)
                  servo1 = ((motor1 + y)/2) * 90;
              if(motor2 > 0)
                  servo2 = ((motor2 + y)/2) * 90;
              if(motor3 > 0)
                  servo3 = ((motor3 + y)/2) * 90;
              if(motor4 > 0)
                  servo4 = ((motor4 + y)/2) * 90;
              
              if(motor1 < 0)
                  servo1 = (((-motor1 + y)/2) * 90) + 90;
              if(motor2 < 0)
                  servo2 = (((-motor2 + y)/2) * 90) + 90;
              if(motor3 < 0)
                  servo3 = (((-motor3 + y)/2) * 90) + 90;
              if(motor4 < 0)
                  servo4 = (((-motor4 + y)/2) * 90) + 90;
              
              if(motor1 == 0)
                  servo1 = y *90;
              if(motor2 == 0)
                  servo2 = y *90;
              if(motor3 == 0)
                  servo3 = y *90;
              if(motor4 == 0)
                  servo4 = y *90;
          }
          
          if(y < 1) {
            
          }
          
          if(motor1 == 0)
              motor1 = -1 * y;
          if(motor2 == 0)
              motor2 = -1 * y;
          if(motor3 == 0)
              motor3 = -1 * y;
          if(motor4 == 0)
              motor4 = -1 * y;
          
          System.out.println("1, " + servo1 + ", " + motor1 + ".");
          System.out.println("2, " + servo2 + ", " + motor2 + ".");
          System.out.println("3, " + servo3 + ", " + motor3 + ".");
          System.out.println("4, " + servo4 + ", " + motor4 + ".");
    }
    
}