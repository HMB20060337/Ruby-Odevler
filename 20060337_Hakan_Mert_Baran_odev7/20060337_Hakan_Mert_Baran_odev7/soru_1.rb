kelimeoku = File.readlines('kelimeler.txt')

ingilizce = []
turkce = []
h = {}
i = 0
kelimeoku.each do |e|
  b = e.split(' : ')
  ingilizce[i] = b[0].capitalize
  turkce[i] = b[1].chomp.capitalize
  h[b[0].capitalize] = b[1].capitalize
  i += 1
end

puts 'Hangi dilde kelime bilginizi olcmek istersiniz?'
puts '1) Ingilizce - Turkce'
puts '2) Turkce - Ingilizce'
print 'Secim : '
secim = gets.chomp.to_i
while (secim != 1) && (secim != 2)
  puts 'Hatali giris yaptınız lütfen tekrar deneyin.'
  print 'Secim : '
  secim = gets.chomp.to_i
end

if secim == 1
  a = ingilizce
  b = turkce
  c = 'Turkce'
else
  a = turkce
  b = ingilizce
  c = 'Ingilizce'
end

sorukelime = {}
while sorukelime.size < 4
  rastgele = rand(a.size) - 1
  sorukelime[a[rastgele]] = rastgele
end

yanlislar = {}
sorunumara = 1
while sorunumara <= 4
  rastgelesik = { b[sorukelime.values[sorunumara - 1]] => ' ' }
  while rastgelesik.include?(b[sorukelime.values[sorunumara - 1]]) || h[rastgelesik.keys[0]] == h[b[sorukelime.values[sorunumara - 1]]]
    rastgelesik = {}
    rastgelesik[b.shuffle.first] = ' ' while rastgelesik.size < 4
  end

  puts "SORU #{sorunumara}. #{sorukelime.keys[sorunumara - 1]} ifadesinin #{c} karsiligi asagidakilerden hangisidir?"

  dogrucevapyeri = rand(1..4)
  case dogrucevapyeri
  when 1
    puts "A) #{b[sorukelime.values[sorunumara - 1]]}"
    puts "B) #{rastgelesik.keys[0]}"
    puts "C) #{rastgelesik.keys[1]}"
    puts "D) #{rastgelesik.keys[2]}"
  when 2
    puts "A) #{rastgelesik.keys[0]}"
    puts "B) #{b[sorukelime.values[sorunumara - 1]]}"
    puts "C) #{rastgelesik.keys[1]}"
    puts "D) #{rastgelesik.keys[2]}"
  when 3
    puts "A) #{rastgelesik.keys[1]}"
    puts "B) #{rastgelesik.keys[0]}"
    puts "C) #{b[sorukelime.values[sorunumara - 1]]}"
    puts "D) #{rastgelesik.keys[2]}"
  when 4
    puts "A) #{rastgelesik.keys[2]}"
    puts "B) #{rastgelesik.keys[0]}"
    puts "C) #{rastgelesik.keys[1]}"
    puts "D) #{b[sorukelime.values[sorunumara - 1]]}"
  end

  print 'VERILEN CEVAP :'
  verilencevap = gets.chomp.upcase
  while (verilencevap != 'A') && (verilencevap != 'B') && (verilencevap != 'C') && (verilencevap != 'D')
    puts "Siklar arasinda #{verilencevap} sikki bulunmamaktadir lutfen tekrar cevaplayin."
    print 'VERILEN CEVAP :'
    verilencevap = gets.chomp.upcase
  end
  dogrucevapyerihash = { 1 => 'A', 2 => 'B', 3 => 'C', 4 => 'D' }
  if verilencevap != dogrucevapyerihash[dogrucevapyeri]
    yanlislar[sorunumara] = "#{sorunumara}.sorunun cevabi #{b[sorukelime.values[sorunumara - 1]]} "
  end
  sorunumara += 1
end
puts '--------------------------------'
puts "Test sona erdi #{100 - (yanlislar.size * 25)} puan aldiniz"
unless yanlislar.empty?
  puts "Yanlis yapilan sorular : #{yanlislar.keys.join(',')}"
  puts 'Yanlis yapilan sorularin cevaplari:'
  puts yanlislar.values
end
