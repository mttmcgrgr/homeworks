class QuickSort

  def self.sort1(array)
    return array if array.length == 0

    pivot = rand(array.length)
    left = []
    right = []

    array.each do |el|
      if(el >= pivot)
        right << el
      else
        left << el
      end
    end

    sort1(left) + pivot + sort1(right)
  end



  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |n1, n2| n1 <=> n2 }

   return array if length < 2

   pivot = partition(array, start, length, &prc)
   left = pivot - start
   right = length - (left_length + 1)

   sort2!(array, start, left, &prc)
   sort2!(array, pivot + 1, right, &prc)

   array
  end

  def self.partition(array, start, length, &prc)

    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    pivot_idx = start

    ((start + 1)...(start + length)).each do |idx|
      if prc.call(array[start], array[idx]) > 0
        array[idx], array[pivot_idx + 1] = array[pivot_idx + 1], array[idx]
        pivot_idx += 1
      end
    end

    array[start], array[pivot_idx] = array[pivot_idx], array[start]

    pivot_idx
  end
end
