#include <Servo.h>

const float a1 = 5.0;
const float a2 = 5.9;
const float a3 = 5.5;




Servo servo1;
Servo servo2;
Servo servo3;
// Servo servo4;
// Servo servo5;
// Servo servo6;
// Servo servo7;
// Servo servo8;
// Servo servo9;
// Servo servo10;
// Servo servo11;
// Servo servo12;


void setup() {
  Serial.print(9600);

  //front right leg
  servo1.attach(11);
  servo2.attach(10);
  servo3.attach(9);

  servo1.write(60);
  servo2.write(180);
  servo3.write(150);

// //rear right leg
//   servo7.attach(9);
//   servo8.attach(10);
//   servo9.attach(11);


// // front left leg
//   servo4.attach(3);
//   servo5.attach(5);
//   servo6.attach(6);

//   //rear left leg

//   servo10.attach(3);
//   servo11.attach(5);
//   servo12.attach(6);


// }

}

void loop() {
  // put your main code here, to run repeatedly:

}
