### Numerical Practice Problems

# Write a method `primes(num)` returns an array of the first `num` primes
def primes(num)
  return [] if num.zero?

  set = [2]
  (3..Float::INFINITY).each do |n|
    set << n if check_prime(n)
    return set if set.length == num
  end
  set
end

def check_prime(num)
  (2...num).none? { |n| num % n == 0 }
end

# Write a method that returns the factors of a number in ascending order.
def factors(num)
  (1..num).select { |n| num % n == 0 }
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
def digital_root(num)
  num < 10 ? num : digital_root((num % 10) + digital_root(num / 10))
end

# Recursively calculate the sum of an array of values
def sum_rec(nums)
  return 0 if nums.empty?
  return nums[0] if nums.length == 1

  nums[0] + sum_rec(nums[1..-1])
end

# Write a recursive method that returns the factorial of 'num'
def factorial(num)
  num < 1 ? 1 : num * factorial(num - 1)
end

# Write a recursive implementation of a method that returns the
# first `n` factorial numbers.
def n_factorials(num)
  return [1] if num == 1
  set = n_factorials(num - 1)
  set << set.last * (num - 1)
end
