# take a photo if there are nagashima
# coding: utf-8

import time
import serial
import picamera
import RPi.GPIO as GPIO

PIN = 26
MODE = 0


def setGPIO():
    GPIO.setmode(GPIO.BOARD)
    GPIO.setup(PIN, GPIO.OUT)


def lightUp():
    GPIO.output(PIN, True)


def lightDown():
    GPIO.output(PIN, False)


def capture(name):
    camera = picamera.PiCamera()
    camera.capture(name)
    camera.close()


def confirmNagashima(distance):
    global MODE
    print("%s" % distance)
    if 30 <= distance:
        # lightUp()
        capture('nagashima_now.png')
        # lightDown()
        print("YES")
    else:
        print("NO")


if __name__ == '__main__':
    # print("YES")
    # setGPIO()
    ser = serial.Serial('/dev/ttyACM0', 9600)
    l = ser.readline().split()
    if len(l) != 0:
        confirmNagashima(int(l[0]))
    # GPIO.cleanup()
