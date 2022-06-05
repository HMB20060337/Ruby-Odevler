cumlesatir = File.readlines('cümleler.txt')
cumlekelime = File.read('cümleler.txt').split

i=0
h = {}

cumlekelime.each do |e|
  if h.keys.include? e.downcase
    next
  else
    h[e.downcase] = i
    i+=1
  end
end

h['OOV'] = h.keys.size+1


vektor = {}
cumlesatir.each do |e|
  i=0
  c=[]
  e.chomp.split.each do |x|
    c[i] = h[x.downcase]
    i+=1
  end
  vektor[e.chomp] = c
end

vektor.keys.each do |e|
  puts "#{e.chomp} -> #{vektor[e.chomp]} "
end

puts '--------------------------------'
print 'Cumle giriniz : '

a = gets.chomp.split
b = []
a.each do |e|
  if h.keys.include? e.downcase
    b[a.index(e)] = h[e.downcase]
  else
    b[a.index(e)] = h['OOV']
  end
end

print "#{a.join(' ')} -> #{b}"
















