pay = (10...100).to_a
payda = (10...100).to_a
i = 0
x = 0

while i < 90

  if x == 89

    break

  elsif i == 89

    i = 0
    x += 1

  elsif pay[i] < payda[x] && pay[i] / 10 != pay[i] % 10 && payda[x] / 10 != payda[x] % 10

    if ((pay[i] % 10) == (payda[x] / 10)) && (pay[i]*(payda[x]%10)) == ((pay[i]/10)*payda[x])

      puts "#{pay[i]}/#{payda[x]}  #{pay[i]/10}/#{payda[x]%10}"
      i += 1

    else

      i += 1

    end

  else

    i += 1

  end

end
