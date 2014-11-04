f = File.open("/home/cybage/miami-temperature.txt", "r")
temp = {}
f.each_line do |line|
  line_arr = line.split
  temp[line_arr[0].to_i] = line_arr[1].to_i - line_arr[2].to_i if line_arr[0].to_i != 0
end
p temp.keys
p temp.values
p temp.key(temp.values.max)
p temp.values.max
p temp.values.min
f.close