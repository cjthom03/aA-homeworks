class LRUCache
  attr_reader :cache, :max_size

  def initialize(size)
    @cache = []
    @max_size = size
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    # add MRU to the end (push)
    delete_duplicates(el)
    remove_LRU if cache_overflow?
    @cache.push(el)

  end

  def show
    # shows the items in the cache, with the LRU item first
    print "#{@cache}"
  end

  private
  # helper methods go here!
  def delete_duplicates(el)
    location = @cache.index(el)
    @cache.delete_at(location) if location
  end

  def remove_LRU
    @cache.shift
  end

  def cache_overflow?
    count == @max_size
  end
end
