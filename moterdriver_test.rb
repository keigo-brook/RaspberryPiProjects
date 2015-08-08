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

io1 = open('/sys/class/gpio/export', 'w')
io1.write(20)
io1.close

dir1 = open('/sys/class/gpio/gpio20/direction', 'w')
dir1.write('out')
dir1.close

io2 = open('/sys/class/gpio/export', 'a')
io2.write(21)
io2.close

dir2 = open('/sys/class/gpio/gpio21/direction', 'a')
dir2.write('out')
dir2.close

drive = MoterDriver.new(20, 21)

for i in 0..5 do
  if i % 2 == 0
    drive.cw
  else
    drive.ccw
  end
  sleep 0.5
end

uexport1 = open('/sys/class/gpio/unexport', 'w')
uexport1.write(20)
uexport1.close

uexport2 = open('/sys/class/gpio/unexport', 'w')
uexport2.write(21)
uexport2.close