"""This module is raspberry-pi camera module test."""
# coding: utf-8

import time
import picamera
from paramiko import SSHClient, AutoAddPolicy

HOST = '133.9.250.252'
PORT = 22
USER = 'KeigoOgawa'
PRIVATE_KEY = '/home/pi/.ssh/kattopi1_rsa'


def capture(name):
    print('Capture Start ...')
    camera = picamera.PiCamera()
    camera.capture(name)
    camera.close()
    print('Capture Finish')


def upload(local_file, remote_file):
    print('Upload Start ...')
    ssh = SSHClient()
    ssh.set_missing_host_key_policy(AutoAddPolicy())

    ssh.connect(HOST, PORT, USER, key_filename=PRIVATE_KEY)
    sftp = ssh.open_sftp()

    sftp.put(local_file, remote_file)
    info = sftp.stat(remote_file)
    print("file size: %s byte" % info.st_size)

    sftp.close()
    ssh.close()
    print('Upload Finish')

if __name__ == '__main__':
    start = time.time()
    capture('test.jpg')
    capture_time = time.time() - start
    upload('./test.jpg',
           '/Users/KeigoOgawa/work/RaspberryPiProjects/camera/test.jpg')
    upload_time = time.time() - start
    print("capture end time: %s s" % capture_time)
    print("upload end time: %s s" % upload_time)
