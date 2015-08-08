class Gpio
  def initialize(pin_list)
    @open_pins = []
    pin_list.each do |pin|
      export(pin.to_i)
      @open_pins.push(pin.to_i)
    end
  end

  def export(pin)
    io = open('/sys/class/gpio/export', 'a')
    io.write(pin)
    io.close
  end

  def set_out(pin)
    dir = open("/sys/class/gpio/gpio#{pin}/direction", 'a')
    dir.write('out')
    dir.close
  end

  def set_out_all
    @open_pins.each do |pin|
      set_out(pin)
    end
  end

  def unexport(pin)
    uexport = open('/sys/class/gpio/unexport', 'w')
    uexport.write(pin)
    uexport.close
  end

  def unexport_all
    @open_pins.each do |pin|
      unexport(pin)
    end
  end
end