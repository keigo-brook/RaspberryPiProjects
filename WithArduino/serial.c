#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <string.h>
#include <time.h>

#define DEV_NAME "/dev/ttyACM0"
#define BAUD_RATE B9600
#define BUFF_SIZE 4096

void serial_init(int fd) {
  struct termios tio;
  memset(&tio, 0, sizeof(tio));
  tio.c_cflag = CS8 | CLOCAL | CREAD;
  tio.c_cc[VTIME] = 0;
  // set baud rate
  cfsetispeed(&tio, BAUD_RATE);
  cfsetospeed(&tio, BAUD_RATE);
  // set to device
  tcsetattr(fd, TCSANOW, &tio);
}

int main() {
  unsigned char buffer[BUFF_SIZE], in_data[BUFF_SIZE];
  printf("start serial port read\n");

  // open device file (serial port)
  int fd = open(DEV_NAME, O_RDWR | O_NONBLOCK);

  if (fd < 0) {
    printf("ERROR on device open\n");
    exit(1);
  }

  printf("init serial port\n");
  serial_init(fd);

  printf("start main loop\n");
  int i = 0;
  while (1) {
    int len = read(fd, buffer, BUFF_SIZE);
    if (len == 0) {
      continue;
    }

    if (len < 0 ) {
      printf("ERROR: %d\n", len);
      perror("");
      exit(2);
    }

    for (int j = 0; j < len; j++) {
      in_data[i] = buffer[j];
      i++;
      if (buffer[j] == '\n') {
        in_data[i] = '\0';
        printf("in_data: %s\n", &in_data[0]);
        i = 0;
        memset(in_data, 0, BUFF_SIZE);
      }
    }
    memset(buffer, 0, BUFF_SIZE);
  }
}
