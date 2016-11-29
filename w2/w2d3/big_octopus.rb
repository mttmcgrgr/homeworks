fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def slug_octo(arr)
  longest_length = 0
  longest_fish = ""
  arr.each do |fish|
    if fish.length > longest_length
      longest_length = fish.length
      longest_fish = fish
    end
    longest_fish
end

def merge_sort(arr, &prc)
  return arr if arr.length <= 1
  prc =|| Proc.new { |num1, num2| num1 <=> num2 }

  mid = arr.length / 2

  merge(merge_sort(arr.take(mid), &prc),
  merge_sort(arr.drop(mid), &prc))

end

def merge(left, right)
  merged_arr = []

  until left.empty? || right.empty?
    case left.first <=> right.first
    when - 1
      merged_arr << left.shift
    when 0
      merged_arr << left.shift
    when 1
      merged_arr << right.shift
    end
  end
  merged_arr + left + right
end
