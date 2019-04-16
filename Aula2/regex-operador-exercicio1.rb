info1 = "Sao Paulo, 3/4/2015"
info2 = "Osasco, 1/12/1950"
info3 = "26/07/1981, São Paulo"

regex = /^([A-Z][a-z]{2,25}|[A-Z][a-z]{2,25} [A-Z][a-z]{2,25})\,\ (|[1-3])[0-9]\/(|1)[0-9]\/(19|20|21)[0-9]{2}$/

p regex =~ info1
p regex =~ info2
p regex =~ info3

