require 'io/console'
require "gpio.rb"
require "moter_driver.rb"

pins = [20, 21]
gpio = Gpio.new(pins)
gpio.set_out_all

driver = MoterDriver.new(pins[0], pins[1])

for i in 0..5 do
  if i % 2 == 0
    drive.cw
  else
    drive.ccw
  end
  sleep 0.5
end

gpio.unexport_all