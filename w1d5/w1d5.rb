class Stack
  attr_accessor :stack

  def initialize
    @stack = Array.new
  end

  def add(el)
    stack.push(el)
    el
  end

  def remove
    stack.pop
  end

  def show
    stack.dup
  end
end

class Queue
  attr_accessor :queue

  def initialize
    @queue = Array.new
  end

  def enqueue(el)
    queue.unshift(el)
    el
  end

  def dequeue
    queue.pop
  end

  def show
    queue.dup
  end
end

class Map
  attr_accessor :map

  def initialize
    @map = Array.new { Array.new }
  end

  def assign(key, value)
    idx = map.index { |array| array.first == key }
    idx ? map[idx][1] = value : map << [key, value]
    [key, value]
  end

  def lookup(key)
    idx = map.index { |array| array.first == key }
    idx ? map[idx][1] : nil
  end

  def remove(key)
    map.delete_if { |array| array.first == key }
    nil
  end

  def show
    deep_dup(map)
  end

  private
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
