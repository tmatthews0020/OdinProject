sort_this = []
(0..1000000).each {|x| sort_this << rand(x)}

t = Time.now()



def merge_sort(sort)
  left = []
  right = []
  result = []
  return sort if sort.length <= 1
  pivot = sort.length/2
  sort[0..pivot - 1].each { |ele| left << ele }
  sort[pivot..-1].each {|ele| right << ele}
  left = merge_sort(left)
  right = merge_sort(right)
  result = merge(left, right)
  result
end

def merge(left, right)
  result = []
  while(!left.empty? && !right.empty?)
    a,b = left.shift, right.shift
    if(b > a)
      result << a
      right.unshift(b)
    else
      result << b
      left.unshift(a)
    end
  end
  if(left.empty?)
    right.each {|e| result << e}
  else
    left.each {|e| result << e}
  end
  result
end

a = [1,2,3,4]
puts merge_sort(sort_this)

puts "this sort took #{Time.now - t}"
