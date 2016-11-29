def bubble_sort(arr)

  loop do
    swapped = false
    (0..arr.length - 1).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
  break if swapped == false
  end

  arr
end



def quick_sort(arr)
  return arr if arr.length <= 1

  pivot = [arr.first]
  left = arr[1..-1].select {|val| val < arr.first }
  right = arr[1..-1].select {|val| val >= arr.first}

  quick_sort(left) + pivot + quick_sort(right)

end






def merge_sort(arr)

  return arr if arr.length <= 1

  mid = arr.length / 2
  left_sorted = merge_sort(arr.take(mid))
  right_sorted = merge_sort(arr.drop(mid))

  merge(left_sorted, right_sorted)
end



def merge(left, right)

  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end


def my_bsearch(target, &prc)
  return nil if size == 0
  prc ||= proc {|a, b| a <=> b}

  mid = size/2

  case prc.call(self[mid], target)
  when 0
    return mid
  when 1
    return self.take(mid).my_bsearch(target, &prc)
  else
    search_res = self.drop(mid+1).my_bsearch(target, &prc)
    search_res.nil? ? nil : mid + 1 + search_res
  end
end
