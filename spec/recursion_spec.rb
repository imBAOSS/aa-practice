require 'rspec'
require 'recursion'

describe "#primes" do
  it "returns first five primes in order" do
    expect(primes(5)).to eq([2, 3, 5, 7, 11])
  end

  it "returns an empty array when asked for zero primes" do
    expect(primes(0)).to eq([])
  end
end

describe "#factors" do
  it "returns the factors of 10 in order" do
    expect(factors(10)).to eq([1, 2, 5, 10])
  end

  it "returns just two factors for primes" do
    expect(factors(13)).to eq([1, 13])
  end
end

describe '#sum_rec' do
  it "returns 0 if no values are given" do
    expect(sum_rec([])).to eq(0)
  end

  it "returns the first value if 1 value is given" do
    expect(sum_rec([1])).to eq(1)
  end

  it "calls itself recursively" do
    expect(self).to receive(:sum_rec).at_least(:twice).and_call_original
    sum_rec([1, 2, 3, 4])
  end

  it "sums multiple numbers" do
    expect(sum_rec([1, 2, 3, 4])).to eq(10)
  end

  it "sums multiple numbers II" do
    expect(sum_rec([-10, 10, 5, 4])).to eq(9)
  end
end

describe "#factorial" do
  it "returns first factorial number" do
    expect(factorial(1)).to eq(1)
  end

  it "returns first two factorial numbers" do
    expect(factorial(2)).to eq(2)
  end

  it "returns many factorials numbers" do
    expect(factorial(6)).to eq(720)
  end

  it "calls itself recursively" do
    expect(self).to receive(:factorial).at_least(:twice).and_call_original
    factorial(6)
  end
end

describe "#fibonacci" do
  it "returns 0 when no number is requested" do
    expect(fibonacci(0)).to eq(0)
  end

  it "returns first fibonacci number" do
    expect(fibonacci(1)).to eq(1)
  end

  it "returns second fibonacci numbers" do
    expect(fibonacci(2)).to eq(1)
  end

  it "returns many fibonacci numbers" do
    expect(fibonacci(6)).to eq(8)
    expect(fibonacci(10)).to eq(55)
  end

  it "calls itself recursively" do
    expect(self).to receive(:fibonacci).at_least(:twice).and_call_original
    fibonacci(6)
  end
end

describe "#palindrome?" do
  it "returns true for 'racecar'" do
    expect(palindrome?("racecar")).to be_truthy
  end

  it "returns true for 'neveroddoreven'" do
    expect(palindrome?("neveroddoreven")).to be_truthy
  end

  it "returns false for 'ruby'" do
    expect(palindrome?("rubular")).to be_falsey
  end

  it "calls itself recursively" do
    expect(self).to receive(:palindrome?).at_least(:once)
  end
end

describe "Bonus#n_factorials" do
  it "returns an array with the first factorial" do
    expect(n_factorials(1)).to eq([1])
  end

  it "returns an array with the first two factorials" do
    expect(n_factorials(2)).to eq([1, 2])
  end

  it "returns an array of factorials" do
    expect(n_factorials(6)).to eq([1, 2, 6, 24, 120, 720])
    expect(n_factorials(10)).to eq([1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800])
  end

  it "calls itself recursively" do
    expect(self).to receive(:n_factorials).at_least(:twice).and_call_original
    n_factorials(6)
  end
end

describe "Bonus#n_fibonaccis" do
  it "returns an array with the first fibonacci number" do
    expect(n_fibonaccis(1)).to eq([1])
  end

  it "returns first two fibonacci numbers" do
    expect(n_fibonaccis(2)).to eq([1, 1])
  end

  it "returns many fibonacci numbers" do
    expect(n_fibonaccis(6)).to eq([1, 1, 2, 3, 5, 8])
    expect(n_fibonaccis(10)).to eq([1, 1, 2, 3, 5, 8, 13, 21, 34, 55])
  end

  it "calls itself recursively" do
    expect(self).to receive(:n_fibonaccis).at_least(:twice).and_call_original
    n_fibonaccis(6)
  end
end
