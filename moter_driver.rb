class MoterDriver
  def initialize(in1, in2)
    @in1 = in1
    @in2 = in2
  end

  def output(out, pin)
    v = open("/sys/class/gpio/gpio#{pin}/value", 'w')
    v.write(out)
    v.close
  end

  def stop
    output(0, @in1)
    output(0, @in2)
  end

  def brake
    output(1, @in1)
    output(1, @in2)
  end

  def cw
    brake
    sleep 0.5
    output(0, @in1)
    output(1, @in2)
  end

  def ccw
    brake
    sleep 0.5
    output(1, @in1)
    output(0, @in2)
  end
end