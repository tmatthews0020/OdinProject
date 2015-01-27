def substrings(word, dictionary)
  #hash
  results = {}
  # split string into a new array
  words = word.split(' ')
  words.each {|x| results[x] = 0}

  words.each do |word|
    dictionary.each do |dic_word|
      if(dic_word.include? word)
        results[word] += 1
      end
    end
  end
     return results
  # check dictionary against each string
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("how below go", dictionary)
