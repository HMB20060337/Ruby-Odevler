puts 'Araba Markası      Araç Kodu  '
puts '-------------      ---------  '
puts 'Renault                1'
puts 'Mazda                  2'
puts 'Honda                  3'
print "Ford                   4\n\n"

puts 'Programdan cikmak icin marka olarak 111 giriniz.'

renault = 0
renault_tutar = 0
mazda = 0
mazda_tutar = 0
honda = 0
honda_tutar = 0
ford = 0
ford_tutar = 0

loop do

  print 'Marka, tutar giriniz :'
  a, b = gets.chomp.split

  if a.to_i == 111
    puts 'program sona erdi'
    break
  elsif a.to_i == 1
    renault += 1
    renault_tutar += b.to_f
  elsif a.to_i == 2
    mazda += 1
    mazda_tutar += b.to_f
  elsif a.to_i == 3
    honda += 1
    honda_tutar += b.to_f
  elsif a.to_i == 4
    ford += 1
    ford_tutar += b.to_f
  else
    puts 'Hatali deger girdiniz.'
  end

end

puts '--------------'
puts 'Ozet Bilgiler'

marka = [renault, mazda, honda, ford]
en_cok_gelen = marka.max

if en_cok_gelen == renault
  puts "En çok gelen araç markasi Renault (#{renault} kez)"
elsif en_cok_gelen == mazda
  puts "En çok gelen araç markasi Mazda (#{mazda} kez)"
elsif en_cok_gelen == honda
  puts "En çok gelen araç markasi Honda (#{honda} kez)"
elsif en_cok_gelen == ford
  puts "En çok gelen araç markasi Ford (#{ford} kez)"
end

satis = [renault_tutar, mazda_tutar, honda_tutar, ford_tutar]
en_cok_satan = satis.max

if en_cok_satan == renault_tutar
  puts "En cok satis yapilan marka Renault (#{renault_tutar})TL"
elsif en_cok_satan == mazda_tutar
  puts "En cok satis yapilan marka Mazda (#{mazda_tutar})TL"
elsif en_cok_satan == honda_tutar
  puts "En cok satis yapilan marka Honda (#{honda_tutar})TL"
elsif en_cok_satan == ford_tutar
  puts "En cok satis yapilan marka Ford (#{ford_tutar})TL"
end
