# require "byebug"

def range(min, max)
  return [] if max < min
  range(min, max - 1) << max
end

def sum(arr)
  return 0 if arr.empty?
  sum(arr.drop(1)) + arr.first
end

def exp1(b, n)
  return 1 if n == 0
  b * exp(b, n - 1)
end

def exp2(b, n)
  return 1 if n == 0
  if n.even?
    half = exp2(b, n / 2)
    half * half
  else
    half = exp2(b, (n - 1) / 2)
    b * half * half
  end

end

# p sum([1, 2, 3, 4])

p exp2(2, 4)
# p 2 ** 4
# p range(0, 5)
