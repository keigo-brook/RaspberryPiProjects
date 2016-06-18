from sentabe_client import SentabeClient
from datetime import datetime
import spidev

spi = spidev.SpiDev()=
# spi.open(bus, device)
spi.open(0, 0)


class LM35DZ(SentabeClient):

    def readAdc(self, ch):
        adc = spi.xfer2([1, (8 + ch) << 4, 0])
        data = ((adc[1] & 3) << 8) + adc[2]
        return [data, datetime.now()]

    def getData(self):
        # 1ch -> 0, ..., 8ch -> 7
        ch = 0
        data, time = self.readAdc(ch)
        temp_c = ((5.0 * data) / 1024) * 100
        print("%s %s" % (time, temp_c))
        return [temp_c, time]


if __name__ == '__main__':
    type = "FloatDatum"
    data_type_id = 2
    sensor_id = 4
    c = LM35DZ(type, data_type_id, sensor_id)
    c.run()
