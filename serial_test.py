# -*- coding: utf-8 -*-
import RPi.GPIO as GPIO
import serial
import time

PIN = 26
MODE = 0


def setGPIO():
    GPIO.setmode(GPIO.BOARD)
    GPIO.setup(PIN, GPIO.OUT)


def lightUp():
    GPIO.output(PIN, True)


def lightDown():
    GPIO.output(PIN, False)


def changeMode(distance):
    print("distance: %s cm" % distance)
    global MODE
    if 10 <= distance <= 30:
        lightUp()
        MODE = 1
    elif MODE == 1:
        lightDown()
        MODE = 0
    print("MODE: %s" % MODE)


if __name__ == '__main__':
    setGPIO()
    ser = serial.Serial('/dev/ttyACM0', 9600)
    time.sleep(2)
    print("Setup Done")
    while True:
        l = ser.readline().split()
        if len(l) != 0:
            changeMode(int(l[0]))
        time.sleep(1)
