io = open('/sys/class/gpio/export', 'w')
io.write(21)
io.close

dir = open('/sys/class/gpio/gpio21/direction', 'w')
dir.write('out')
dir.close

out = 1
10.times do
  v = open('/sys/class/gpio/gpio21/value', 'w')
  v.write(out)
  v.close
  out = out == 1 ? 0 : 1
  sleep 0.5
end

uexport = open('/sys/class/gpio/unexport', 'w')
uexport.write(21)
uexport.close
