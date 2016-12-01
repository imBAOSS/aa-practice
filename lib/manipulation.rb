### Array Manipulation Problems

class Array

  # Write a new Array method (using monkey-patching) that will return
  # the location of all identical elements. The keys are the
  # duplicated elements, and the values are arrays of their positions,
  # sorted lowest to highest.
  def dups
  end

  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.
  def pair_sum(target)
  end
end

### String Manipulation Problems

class String

  # Determine if a string is symmetrical. 'racecar' and 'too hot to hoot' are
  # examples of symmetrical strings. Do NOT use any built-in `reverse` methods.
  def symmetrical?
  end

  # Write a `String#symmetric_substrings` method that takes a returns
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.
  def symmetric_substrings
  end
end

# Write a function, `caesar_cipher(str, shift)` which will take a message and
# an increment amount and outputs the encoded message. Assume lowercase and
# no punctuation. Preserve spaces.
def caesar_cipher(str, shift)
end
