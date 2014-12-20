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


puts bubble_sort([1,5,7,3,23,6,4,7,54])
