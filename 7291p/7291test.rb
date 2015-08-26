require 'io/console'
require "../lib/gpio.rb"
require "../lib/moter_driver.rb"

pins = [20, 21, 22, 23]
gpio = Gpio.new(pins)
gpio.set_out_all

driver1 = MoterDriver.new(pins[0], pins[1])
driver2 = MoterDriver.new(pins[2], pins[3])

for i in 0..5 do
  if i % 2 == 0
    driver1.cw
  else
    driver1.ccw
  end
  sleep 0.5
end

for i in 0..5 do
  if i % 2 == 0
    driver2.cw
  else
    driver2.ccw
  end
  sleep 0.5
end

gpio.unexport_all