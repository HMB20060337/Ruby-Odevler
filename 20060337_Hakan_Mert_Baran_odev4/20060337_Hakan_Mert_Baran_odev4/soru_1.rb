terim_sayisi = 10
i = 0
a = []
a[0] = 1

while i < terim_sayisi

  a[i + 1] = (1 + (1 / a[i])).to_f

  puts "#{i + 1}. değer = #{a[i]}"

  i += 1

end
