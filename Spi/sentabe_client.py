# -*- coding:utf-8 -*-

import threading
import requests
import json
import time
from datetime import datetime


class SentabeClient():
    # set server parameter
    host = "192.168.0.84"
    port = "3000"
    path = "/api/sensor_data"
    url = "http://" + host + ":" + port + path

    def __init__(self, type, data_type_id, sensor_id):
        self.type = type
        self.data_type_id = data_type_id
        self.sensor_id = sensor_id

    def run(self):
        t = threading.Thread(target=self.postData, args=(1,))
        t.start()

    def post(self, data, time):
        payload = {
            "type": self.type,
            "data_type_id": str(self.data_type_id),
            "float_datum": {
                "sensor_id": str(self.sensor_id),
                "fdata": str(data),
                "captured_at(1i)": str(time.year),
                "captured_at(2i)": str(time.month),
                "captured_at(3i)": str(time.day),
                "captured_at(4i)": str(time.hour),
                "captured_at(5i)": str(time.minute),
                "captured_at(6i)": str(time.second),
            }
        }
        res = requests.post(
            self.url,
            json.dumps(payload),
            headers={'Content-Type': 'application/json'}
        )
        return res

    def postData(self, between_time):
        data, time = self.getData()
        res = self.post(data, time)
        next_time = res.json()['next_time']
        t = threading.Timer(next_time, self.postData, args=(next_time,))
        t.start()

    def getData(self):
        """override with individual sensor method
        and return obtained data with captured time
        """
        # write sensor method here
        data, time = 0, datetime.now()
        return [data, time]
