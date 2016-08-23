import time
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)


class MoterDriver:

    """docstring for 7291p"""
    def __init__(self, in1, in2):
        GPIO.setup(in1, GPIO.OUT)
        GPIO.setup(in2, GPIO.OUT)
        self.in1 = in1
        self.in2 = in2

    def stop(self):
        GPIO.output(self.in1, False)
        GPIO.output(self.in2, False)

    def brake(self):
        GPIO.output(self.in1, True)
        GPIO.output(self.in2, True)

    def cw(self):
        GPIO.output(self.in1, False)
        GPIO.output(self.in2, True)

    def ccw(self):
        GPIO.output(self.in1, True)
        GPIO.output(self.in2, False)


if __name__ == '__main__':
    driver1 = MoterDriver(4, 14)
    driver2 = MoterDriver(17, 18)
    for i in xrange(5):
        if i % 4 == 0:
            print("front")
            driver1.brake()
            driver2.brake()
            time.sleep(0.3)
            driver1.cw()
            driver2.cw()
        elif i % 4 == 1:
            driver1.brake()
            driver2.brake()
            time.sleep(0.3)
            print("left")
            driver1.cw()
            driver2.ccw()
        elif i % 4 == 2:
            driver1.brake()
            driver2.brake()
            time.sleep(0.3)
            print("right")
            driver1.ccw()
            driver2.cw()
        else:
            driver1.brake()
            driver2.brake()
            time.sleep(0.3)
            print("back")
            driver1.ccw()
            driver2.ccw()
        time.sleep(3)

    GPIO.cleanup()
