# This Program implements a Caesar Cipher

def caesar_cipher(string, num)
  array = string.split('').map do |x|
    x = x.ord

    if(x >= 65 && x <= 90)
      p = x + num

        if(p > 90)
          p = p % 90
          p = p + 64

        end
      end


    if(x >= 97 && x <= 122)
      p = x + num

        if(p > 122)
          p = p % 122
          p = p + 96


        end
      end

      x = p

  end


end



ciphered = caesar_cipher("hello world", 5)
ciphered.class
ciphered.map! {|x| x.chr unless x == nil }
puts ciphered.class
puts ciphered.join
