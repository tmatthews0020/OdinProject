def stock_picker(array)
array.sort!
length = array.length
puts array[0]
puts array[length - 1]

end


stock_picker([0,5,7,2,10,4,4,29,5])
