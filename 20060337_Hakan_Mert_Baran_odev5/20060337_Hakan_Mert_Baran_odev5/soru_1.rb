def dosyaoku(x)
  File.read(x)
end
def dosyayaz(x,y)
  File.write(x,y)
end
def harflere_ayir (x)
  x = x.split
  m = 0
  a = []
  x.each do |e|
    i = 0
    ((e.size)+1).times do
      if (e.size) == i
        a[m] = " "
        m+=1
        i+=1
      else
        a[m]=e[i]
        m+=1
        i+=1
      end
    end
    x = a
  end
  x
end

def numara_ver (x)
  ascii1 = ("A".."Z").to_a
  ascii2 = ("a".."z").to_a
  ascii3 = (" ".."@").to_a
  ascii4 = ("[".."`").to_a
  ascii5 = ("{".."~").to_a
  asciiozel = ascii1+ascii2+ascii3+ascii4+ascii5

  y = []
  i=0
  x.each do |e|
    y[i] = asciiozel.index(e)
    i+=1
  end
  y
end

def kaydir (x,k)
  y=[]
  i = 0
  x.each do |e|
    if e>51
      y[i] = e
      i+=1
    else
      if (e+k)>51
        y[i] = (e+k)%52
        i+=1
      elsif (e+k)<0
        y[i] = 52+(e+k)
        i+=1
      else
        y[i] = e+k
        i+=1
      end
    end
  end
  y
end

def harf_ver (x)
  ascii1 = ("A".."Z").to_a
  ascii2 = ("a".."z").to_a
  ascii3 = (" ".."@").to_a
  ascii4 = ("[".."`").to_a
  ascii5 = ("{".."~").to_a

  asciiozel = ascii1+ascii2+ascii3+ascii4+ascii5

  y = []
  i = 0

  x.each do |e|
    y[i] = asciiozel[e]
    i+=1
  end
  y
end

def sifrele (x,y)
  harf_ver(kaydir(numara_ver(harflere_ayir(x)),y%52)).join
end

def desifre (x,y,z)
  harf_ver(kaydir((numara_ver(harflere_ayir(sifrele(x,y%52)))),-(z%52))).join
end

puts"Okunmasi için metin dosyasinin adini ve uzantisini 'xxxxx.txt' seklinde giriniz."

dosya = gets.chomp

c = dosyaoku("#{dosya}")

puts "Kaydirma miktari giriniz."

kaydirma_miktari = gets.chomp.to_i
puts "-------------------"

puts "Sifrelenmis metniniz hazırlandı ekrana bastırmak icin 1 e"
puts "Sifrelenmis metni 'sifrelenmis.txt' seklınde yeni bir metin dosyasına yazdırmak icin 2 ye basın"

secenek = gets.chomp.to_i
puts "-------------------"

if secenek == 1
  puts sifrele(c,kaydirma_miktari)
  puts "-------------------"
elsif secenek == 2
  dosyayaz('sifrelenmis.txt',sifrele(c,kaydirma_miktari))
else
  puts "Yanlis deger girdiniz varsayilan olarak 2. secenek uygulaniyor."
  dosyayaz('sifrelenmis.txt',sifrele(c,kaydirma_miktari))
end

puts "Sifrelenmis metni desifre edip ekrana bastırmak icin 1 e"
puts "Sifrelenmis metni desifre edip 'desifre.txt' seklinde yeni bir metin dosyasına yazdirmak icin 2 ye basiniz."
puts "Sifrelenmis baska bir metin dosyasını desifre etmek icin 3 e basiniz. "

secenek = gets.chomp.to_i
puts "-------------------"

if secenek == 1
  puts desifre(c,kaydirma_miktari,kaydirma_miktari)
elsif secenek == 2
  dosyayaz('desifre.txt',desifre(c,kaydirma_miktari,kaydirma_miktari))
elsif secenek == 3
  puts "Desifre etmek istediginiz dosyanin adini ve uzantisini 'xxxxxx.txt' seklinde giriniz"

  dosyaadi = gets.chomp
  dosyaoku("#{dosyaadi}")

  puts "Kaydirma miktari giriniz."

  kaydirmadesifre = gets.chomp.to_i

  puts "Metin desifre edilmistir desifre edilmis metni ekrana bastirmak icin 1 e"
  puts "Desifre edilmis metni 'desifre.txt' seklinde yeni bir metin dosyasına yazdirmak icin 2 ye basiniz."
  desifresecenek = gets.chomp.to_i

  if desifresecenek == 1
    puts "-------------------"
    puts sifrele(dosyaoku("#{dosyaadi}"),-(kaydirmadesifre))
  elsif desifresecenek == 2
    dosyayaz('desifre.txt',sifrele(dosyaoku("#{dosyaadi}"),-(kaydirmadesifre)))
  else
    puts "Yanlis deger girdiniz varsayilan olarak 2. secenek uygulaniyor."
    dosyayaz('desifre.txt',sifrele(dosyaoku("#{dosyaadi}"),-(kaydirmadesifre)))
  end

else
  puts "Yanlis deger girdiniz varsayilan olarak 2. secenek uygulaniyor."
  dosyayaz('desifre.txt',desifre(c,kaydirma_miktari,kaydirma_miktari))
end

puts "-------------------"
puts "program sonlandı"













