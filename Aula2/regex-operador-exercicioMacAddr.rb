
mac1 = "18:3d:a2:07:12:10"
mac2 = "f0:de:f1:52:08:76"
mac3 = "00:50:56:c0:00:f8"

regex = /^([0-9a-f]{2,2}:){5,5}[0-9a-f]{2,2}$/
p regex === mac1
p regex === mac2
p regex === mac3
p regex === "f0:de:f1:52:08:7f"

puts "Errados"
p regex === "x1:2:e3:a4:c5:e6"
p regex === "lac:2c:3e:4e:5a:6c"


