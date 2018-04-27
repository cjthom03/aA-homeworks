require 'rspec'
require 'LRU_cache'


RSpec.describe LRUCache do
  subject(:lru) { LRUCache.new(4) }

  describe "#initialize" do
    it "starts with an empty array" do
      expect(lru.cache).to be_an(Array)
      expect(lru.cache).to be_empty
    end

    it "starts with a max cache size of " do
      expect(lru.max_size).to eq(4)
    end
  end

  describe "#count" do
    it "returns the number of elements in the cache" do
      expect(lru.count).to eq(0)
    end

  end

  describe "#add" do
    before(:each) {
      lru.add(5)
      lru.add({a: 1, b: 2, c: 3})
      lru.add("duh")
      lru.add("mmm")
    }
    it "adds an element to the cache" do
      expect(lru.count).to eq(4)
      expect(lru.cache).to eq([5, {a: 1, b: 2, c: 3}, "duh", "mmm"])
    end

    it "removes an item if the cache is at max capacity" do
      lru.add("hmm")
      expect(lru.count).to eq(4)
      expect(lru.cache.last).to eq("hmm")
      expect(lru.cache).to_not include(5)
    end

    it "removes the least recently used items" do
      lru.add(1)
      expect(lru.cache).to eq([{a: 1, b: 2, c: 3}, "duh", "mmm", 1])
      lru.add(2)
      expect(lru.cache).to eq(["duh", "mmm", 1, 2])
    end

    it "does not duplicate items in the cache" do
      lru.add(5)
      lru.add('mmm')
      expect(lru.cache).to eq([{a: 1, b: 2, c: 3}, "duh", 5, 'mmm'])
    end
  end
end
