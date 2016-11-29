#
# MAX_STACK_SIZE = 10
# tracer = proc do |event|
#   if event == 'call' && caller_locations.length > MAX_STACK_SIZE
#     fail "Probable Stack Overflow"
#   end
# end
# set_trace_func(tracer)
#
require 'byebug'

def range(start_r, end_r)
  return [end_r] if start_r == end_r
  arr ||= []
  arr + [start_r] + range(start_r + 1, end_r)
end

#
# p range(1,8)

def recursion1(b, n)
  return b if n == 0
  b * recursion1(b, n - 1)
end

def recursion2(b,n)
  return 1 if n == 0
  if n.odd?
    half_val = recursion2(b, (n - 1) / 2)
    full_value = b * half_val * half_val
  else
    half_val = recursion2(b, n / 2)
    full_value = half_val * half_val
  end
end

class Array

  def deep_dup
    deep_dup = []
    self.each do |el|
      if el.is_a?(Array)
        deep_dup << el.deep_dup
      else
        deep_dup << el
      end
    end
    deep_dup.dup
  end

  def merge_sort
    mid = self.length / 2
    return [self] if self.flatten.length <= 1
    left = self[0...mid]
    right = self[mid..-1]
    left.merge_sort + right.merge_sort
  end

  def merge(left, right)
    new_arr = []
    loop do
      if left.empty? && !right.empty?
        new_arr << right.first
        return new_arr
      elsif right.empty? && !left.empty?
        return new_arr
      end

      if left.first > right.first
        new_arr << right[0]
        right.shift
      else
        new_arr << left[0]
        left.shift
      end
    end
  end
  #
  #
  # def bubble_sort
  #   i = 0
  #   while i < self.length
  #     if self[i] > self[i + 1]
  #       self[i], self[i + 1] = self[i + 1], self[i]
  #       self.bubble_sort
  #     else
  #       i += 1
  #     end
  #   end
  #   self
  # end

end

def merge(left, right)
  new_arr = []
  loop do
    if left.empty? && right.empty?
      return new_arr
    end
    if left.empty? && !right.empty?
      new_arr << right.first
    elsif right.empty? && !left.empty?
      new_arr << left.first
    end

    if left.first > right.first
      new_arr << right[0]
      right.shift
    else
      new_arr << left[0]
      left.shift
    end
  end
end

p merge([1,3,4,1,3], [5,1,4,67])


  # p [1,3,4,1,4,10,1].merge_sort


# p [5,4,3,2,1].merge_sort

def permutations(arr)
  return [[]] if arr.empty?
  first = arr.first
  rest = arr[1..-1]
  rest_perms = permutations(rest)
  perm_total_array = []
  # debugger
  rest_perms.each do |perm|
    (0..perm.length).each do |idx|
      perm_subarr = perm[0...idx] + [first] + perm[idx..-1]
      perm_total_array += [perm_subarr]
      # debugger
    end
  end
  perm_total_array
end

# p permutations([1,2,3])
# puts [2,1,3].permutation_it
# puts [2,3,1].permutation_it

def fib_r(n)
  return [] if n == 0
  return [1] if n == 1
  return [1, 1] if n <= 2
  next_num = [fib_r(n - 1)[-1] + fib_r(n-1)[-2]]
  fib_r(n-1) + next_num
end

def binary(arr, num, start = 0, end_idx = nil)
  end_idx = arr.length - 1 if end_idx.nil?
  mid = (end_idx + start) / 2
  return nil if start > end_idx && num != arr[start]

  case num <=> arr[mid]
  when 0 then return mid
  when -1
    binary(arr,num, start = 0, end_idx = mid - 1)
  when 1
    binary(arr,num, start = mid + 1, end_idx = arr.length - 1)
  end

end
