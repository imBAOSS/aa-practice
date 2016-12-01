### Enumerables Reconstruction Problems

class Array

  # Write a method that calls a passed block for each element of the array

  def my_each
    each_index { |i| yield(self[i]) }
  end

  # Writea  my_inject method. Be aware that if the default accumulator is
  # not passed then the first element of the array is used as the accumulator.

  def my_inject(acc = nil)
    acc ||= shift
    each { |el| acc = yield(acc, el) }
    acc
  end

  # Write `Array` methods `my`_map` and `my_select`.
  # Do not modify the original array.

  def my_map
    mapped = []
    each_index { |i| mapped << yield(self[i]) }
    mapped
  end

  def my_select
    selected = []
    each_index { |i| selected << self[i] if yield(self[i]) }
    selected
  end

  # The method should return the unique elements, in the order they first
  # appeared. Do not use the built-in `uniq` method!

  def my_uniq
    unique = []
    each_index { |i| unique << self[i] unless unique.include?(self[i]) }
    unique
  end

  # Write a method, `my_transpose`, which will convert between the
  # row-oriented and column-oriented representations for both a square grid
  # and a rectangular grid.

  def my_transpose
    row_length = length
    col_length = first.length
    transposed = Array.new(col_length) { Array.new(row_length) }

    (0...row_length).each do |row|
      (0...col_length).each do |col|
        transposed[col][row] = self[row][col]
      end
    end
    transposed
  end

end

class MyHashSet
  attr_reader :store

  # Write a `MyHashSet#initialize` method which sets an empty hash object to
  # `@store`.

  def initialize
    @store = {}
  end

  # Write an `#insert(el)` method that stores `el` as a key in `@store`,
  # storing `true` as the value.

  def insert(el)
    store[el] = true
  end

  # Write a `#delete(el)` method to remove an item from the set.
  # Return `true` if the item had been in the set, else return `false`.

  def delete(el)
    store.delete(el)
  end

  # Write an `#include?(el)` method that sees if `el` has previously been
  # `insert`ed by checking the `@store`; return `true` or `false`.

  def include?(el)
    store.include?(el)
  end

  # Write a method `#to_a` which returns an array of the items in the set.

  def to_a
    store.keys.to_a
  end

  # Write a method `set1#union(set2)` which returns a new set which
  # includes all the elements in `set1` or `set2` (or both).

  def union(other)
    set = MyHashSet.new
    (to_a + other.to_a).uniq.each { |el| set.insert(el) }
    set
  end

  # Write a `set1#intersect(set2)` method that returns a new set which
  # includes only those elements that are in both `set1` and `set2`.

  def intersect(other)
    set = MyHashSet.new
    to_a.each { |el| set.insert(el) if other.include?(el) }
    set
  end

  # Write a `set1#minus(set2)` method which returns a new set which includes
  # all the items of `set1` that aren't in `set2`.

  def minus(other)
    set = MyHashSet.new
    to_a.each { |el| set.insert(el) unless other.include?(el) }
    set
  end

  # Write a `set1#symmetric_difference(set2)` method; it should return the
  # elements contained in either `set1` or `set2`, but not both!

  def symmetric_difference(other)
    set = MyHashSet.new
     self.to_a.each { |el| set.insert(el) unless other.include?(el) }
    other.to_a.each { |el| set.insert(el) unless  self.include?(el) }
    set
  end

  # Write a `set1#==(object)` method. It should return true if `object` is
  # a `MyHashSet`, has the same size as `set1`, and every member of
  # `object` is a member of `set1`.

  def ==(other)
    return false unless to_a.length == other.to_a.length
    to_a.all? { |el| other.include?(el) }
  end
end
