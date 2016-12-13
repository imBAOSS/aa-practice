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

# Recursively calculate the sum of an array of values

def sum_rec(nums)
  return 0 if nums.empty?
  return nums.first if nums.length == 1
  nums.shift + sum_rec(nums)
end

# Write a recursive method that returns the factorial of 'num'

def factorial(num)
  num < 1 ? 1 : num * factorial(num - 1)
end

# Recursively build a Fibonacci set of num elements

def fibonacci(num)
  return num if num == 1 || num == 0
  fibonacci(num - 1) + fibonacci(num - 2)
end

# Bonus create a method that leverages factorial to recursively create
# an array of n number factorials

def n_factorials(n)
  return [1] if n == 1
  n_factorials(n - 1) << find_factorial(n)
end

# Bonus create a method that leverages fibonacci to recursively create
# an array of the nth number in the fibonacci sequence
def n_fibonaccis(n)
  return [fibonacci(n)] if n == 1
  n_fibonaccis(n - 1) << fibonacci(n)
end
