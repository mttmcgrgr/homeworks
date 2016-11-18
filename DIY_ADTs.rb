require "byebug"

class Stack
    def initialize
      @stack = []
      # create ivar to store stack here!
    end

    def add(el)
      @stack << el

      # adds an element to the stack
    end

    def remove
      @stack.pop
      # removes one element from the stack
    end

    def show
      stack = @stack
      # return a copy of the stack
    end
  end

x = Stack.new

# p x.add(2)
# p x.show
# p x.remove
# p x.show

class Queue

      def initialize(queue = [])
        @queue = queue
      end

      def enqueue(el)
        @queue.push(el)
      end

      def dequeue
        @queue.shift
      end

      def show
        queue = @queue
      end

  end

x = Queue.new([1,2,3])

# p x.enqueue(4)
# p x.show
# p x.dequeue
# p x.show

class Map

      def initialize
        @map = []
      end

      def assign(key,val)
        pair_index = @map.index {|pair| pair[0] == key}
        pair_index ? @map[pair_index][1] = val : @map.push([key, val])
        [key,val]
      end

      def lookup(key)
        @map.each {|pair| return pair[1] if pair[0] == key}
        nil
      end

      def remove(key)
        return nil if @map == []
        @map.each_with_index do |pair,idx|
          if pair.first == key
            @map.delete_at(idx)
          end
        end
        nil
      end

      def show
        deep_dup(@map)
      end

      def deep_dup(arr)
        dup = arr.map {|el| el.is_a?(Array) ? deep_dup(el) : el}
      end

  end

  x = Map.new
  x.assign(1,2)
  p x.show
