# not recursive
def fibs(n)
count = 0
temp = 0
fib1 = 0
fib = 1
while count < n - 1
  temp = fib
  fib = fib + fib1
  fib1 = temp
  count += 1
end
fib
end

puts fibs(5)
puts fibs(10)

# this is recursive
def fibs_rec(n, fib =0, fib1 = 1)
  if(n == 0)
     fib
   else
     fibs_rec(n - 1, fib + fib1, fib)
   end
end


puts fibs_rec(5)
puts fibs_rec(10)
