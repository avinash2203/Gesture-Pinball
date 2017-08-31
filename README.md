# Gesture-Pinball
Arduino based gesture pinball game

Hardware Components: Arduino Uno microcontroller, ADXL335 accelerometer.
Frameworks: Processing 3.0.1, Arduino interface 1.6.1

Project Decription

The accelerometer is designed to work in 3-axes. Based on the rotation of the accelerometer in particular axis, it sends values  to 
the arduino. Say currently the values returned in stable state is (250,300). These are the x-axis and y-axis values. When the accelerometer
is rotated in positive x direction the x-value increases say (260,300) and keeps on increasing as we keep turning the sensor. And vice versa
for negative rotation. Similarily for all the 3-axes.

Our interface for the game is quit simple. It's a lite game based o processing the same famework in which arduino is based.
It's a game in which there is a retangular movable paddle in the bottom and a ball keeps moving and reflects after colliding the walls.
So the movable paddle is controlled using the accelerometer.

Avinash Singh


