#### WORK IN PROGRESS ####

### Sorting Problems
# Do not modify the original array.
# Use blocks to sort if provided.

class Array

  def bubble_sort
    dup.bubble_sort!
  end

  def bubble_sort!(&prc)
    prc ||= proc { |x, y| x <=> y }
    sorted = false

    until sorted
      sorted = true
      each_index do |i|
        next if i + 1 == size
        if prc.call(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end

    self
  end

  def merge_sort(&prc)
    return self if length <= 1

    prc ||= proc { |x, y| x <=> y }
    mid = length / 2

    merge(self[0...mid].merge_sort(&prc),
          self[mid..-1].merge_sort(&prc), &prc)
  end

  def merge(left, right, &prc)
    return left  if right.empty?
    return right if left.empty?

    comparison = prc.call(left[0], right[0])

    if comparison < 0
      [left[0]] + merge(left[1..-1], right, &prc)
    else
      [right[0]] + merge(right[1..-1], left, &prc)
    end
  end

  # ### a/A Solution
  #
  # def merge(left, right, &prc)
  #   merged = []
  #
  #   until left.empty? || right.empty?
  #     case prc.call(left.first, right.first)
  #     when -1
  #       merged << left.shift
  #     when 0
  #       merged << left.shift
  #     when 1
  #       merged << right.shift
  #     end
  #   end
  #
  #   merged.concat(left)
  #   merged.concat(right)
  #
  #   merged
  # end

  def quick_sort(&prc)
    return self if length <= 1

    prc ||= proc { |x, y| x <=> y }
    left, right = [], []
    pivot = rand(size)

    each_index do |i|
      next if i == pivot
      comparison = prc.call(self[i], self[pivot])
      comparison < 1 ? left << self[i] : right << self[i]
    end

    left.quick_sort(&prc) + [self[pivot]] + right.quick_sort(&prc)
  end
end
