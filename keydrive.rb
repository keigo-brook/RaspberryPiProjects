require 'io/console'
require "./lib/gpio.rb"
require "./lib/moter_driver.rb"

pins = [20, 21]
gpio = Gpio.new(pins)
gpio.set_out_all

driver = MoterDriver.new(pins[0], pins[1])

puts 'key driving mode start'
puts 'w: move forward, s: move back, b: brake,  q: quit'

loop do
  c = ''
  loop do
    c = STDIN.getch
    break if c != nil
  end
  case c
  when  ?\C-c, 'q'
    break
  when 'w'
    driver.cw
  when 's'
    driver.ccw
  when 'b'
    driver.brake
  when ''
    driver.stop
  end
  sleep 0.1
end

gpio.unexport_all
