### Enumerables Reconstruction Problems

class Array

  # Write a method that calls a passed block for each element of the array
  def my_each
  end

  # Write a my_inject method. Be aware that if the default accumulator is
  # not passed then the first element of the array is used as the accumulator.
  def my_inject(acc = nil)
  end

  # Write `Array` methods `my_map` and `my_select`.
  # Do not modify the original array.
  def my_map
  end

  def my_select
  end

  # The method should return the unique elements, in the order they first
  # appeared. Do not use the built-in `uniq` method!
  def my_uniq
  end

  # Write a method, `my_transpose`, which will convert between the
  # row-oriented and column-oriented representations.
  def my_transpose
  end

end

class MyHashSet

  # Write a `MyHashSet#initialize` method which sets an empty hash object to
  # `@store`.
  def initialize
  end

  # Write an `#insert(el)` method that stores `el` as a key in `@store`,
  # storing `true` as the value.
  def insert(el)
  end

  # Write a `#delete(el)` method to remove an item from the set.
  # Return `true` if the item had been in the set, else return `false`.
  def delete(el)
  end

  # Write an `#include?(el)` method that sees if `el` has previously been
  # `insert`ed by checking the `@store`; return `true` or `false`.
  def include?(el)
  end

  # Write a method `#to_a` which returns an array of the items in the set.
  def to_a
  end

  # Write a method `set1#union(set2)` which returns a new set which
  # includes all the elements in `set1` or `set2` (or both).
  def union(other)
  end

  # Write a `set1#intersect(set2)` method that returns a new set which
  # includes only those elements that are in both `set1` and `set2`.
  def intersect(other)
  end

  # Write a `set1#minus(set2)` method which returns a new set which includes
  # all the items of `set1` that aren't in `set2`.
  def minus(other)
  end

  # Write a `set1#symmetric_difference(set2)` method; it should return the
  # elements contained in either `set1` or `set2`, but not both!
  def symmetric_difference(other)
  end

  # Write a `set1#==(object)` method. It should return true if `object` is
  # a `MyHashSet`, has the same size as `set1`, and every member of
  # `object` is a member of `set1`.
  def ==(other)
  end
end
