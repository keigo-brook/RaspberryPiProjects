# -*- coding: utf-8 -*-

import serial

if __name__ == '__main__':
    count = 0
    ser = serial.Serial('/dev/ttyACM0', 9600)
    print(ser.portstr)
    time.sleep(3)

    while 1:
        time.sleep(1)
        data = ser.readline()

        if count > 0:
            datea = float(data)
            print(time.ctime() + ', ' + str(data))

        # if data > 20:
        # do something

        count += 1
