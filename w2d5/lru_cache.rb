class LRUCache

  def initialize(size)
    @cash = []
    @size = size
  end

  def count
    @cash.count
  end

  def add(el)
    @cash.delete(el)
    @cash.push(el)
    remove_extra if @cash.count > @size
  end

  def show
    p @cash
    nil
  end

  def remove_extra
    @cash.shift
  end

end

# if __FILE__ == $PROGRAM_NAME
#   johnny_cache = LRUCache.new(4)
#
#   johnny_cache.add("I walk the line")
#   johnny_cache.add(5)
#
#   johnny_cache.count # => returns 2
#
#   johnny_cache.add([1,2,3])
#   johnny_cache.add(5)
#   johnny_cache.add(-5)
#   johnny_cache.add({a: 1, b: 2, c: 3})
#   johnny_cache.add([1,2,3,4])
#   johnny_cache.add("I walk the line")
#   johnny_cache.add(:ring_of_fire)
#   johnny_cache.add("I walk the line")
#   johnny_cache.add({a: 1, b: 2, c: 3})
#
#   johnny_cache.show  # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
# end
