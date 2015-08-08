require 'io/console'
require "./lib/gpio.rb"
require "./lib/moter_driver.rb"

pins = [20, 21]
gpio = Gpio.new(pins)
gpio.set_out_all

driver = MoterDriver.new(pins[0], pins[1])

loop do 
  puts 'press s key to start drive!'
  input = gets.chop
  break if input == 's'
end

puts 'key driving mode start'
puts 'w: move forward, s: move back q: quit'

loop do
  c = STDIN.getch
  exit if c == ?\C-c || c == 'q'
  if c == 'w'
    driver.cw
  elsif c == 's'
    driver.ccw
  end
  sleep 0.1
end

gpio.unexport_all