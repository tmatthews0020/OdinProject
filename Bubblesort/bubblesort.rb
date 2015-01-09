def bubble_sort(array)



sorted = false
length = array.length

while(!sorted)
	sorted = true
	x = 0
	while(x < length -1)



	if(array[x] > array[x+1])
		temp = array[x]
		array[x] = array[x+1]
		array[x+1] = temp
		sorted = false
	end
	x +=1
end
x = 0
end
return array
end
a = []
(0..100000).each {|x| a << rand(x) }

t = Time.now
puts bubble_sort(a)


puts "This sort took #{Time.now - t} seconds"
