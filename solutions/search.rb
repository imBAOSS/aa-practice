### Search Algorithm

class Array

  # Write a recursive method "#binary_search" that returns the index of the
  # given number in a sorted array.
  def binary_search(num)
    return nil if length <= 1

    mid = length / 2

    if num == self[mid]
      mid

    elsif num < self[mid]
      self[0...mid].binary_search(num)

    else
      right = self[mid..-1].binary_search(num)
      right.nil? ? nil : mid + right
    end
  end

end
