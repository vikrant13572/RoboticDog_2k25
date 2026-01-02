#include <Servo.h>



const float a1 = -5.0;
const float a2 = 5.9;
const float a3 = 5.5;

const float x = -5.0;
const float y = 11.4;
const float z = 0;

float theta1,theta2,theta3;

Servo servo1;
Servo servo2;
Servo servo3;



void setup() {
  Serial.begin(9600);
  servo1.attach(11);
  servo2.attach(10);
  servo3.attach(9);

  calculateAndMove();
}

void calculateAndMove() {
  float r_xy = sqrt(x * x + y * y);
  float L = sqrt(r_xy * r_xy - a1 * a1);

  float theta1_rad = atan2(y, x) - atan2(L, a1);
  theta1 = degrees(theta1_rad);
  Serial.print("Theta1 = ");
  Serial.println(theta1);

  float reach = sqrt(L * L + z * z);
  float phi = atan2(z, L);

  float cos_theta3 = (a2 * a2 + a3 * a3 - reach * reach) / (2 * a2 * a3);
  cos_theta3 = constrain(cos_theta3, -1.0, 1.0);
  theta3 = 180.0 - degrees(acos(cos_theta3));
  Serial.print("Theta3 = ");
  Serial.println(theta3);

  float alpha = acos((a2 * a2 + reach * reach - a3 * a3) / (2 * a2 * reach));
  theta2 = degrees(phi - alpha);
  Serial.print("Theta2 = ");
  Serial.println(theta2);

  int s1 = constrain(theta1, 0, 180);
  int s2 = constrain(theta2, 0, 180);
  int s3 = constrain(theta3, 0, 180);

  servo1.write(s1);
  servo2.write(s2);
  servo3.write(s3);

  Serial.println("Servo Positions Updated!");
}

void loop() {
 

}
