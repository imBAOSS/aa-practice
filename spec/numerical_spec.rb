require 'rspec'
require 'numerical'


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

describe "#digital_root" do
  it "calculates the digital root of a single-digit number" do
    expect(digital_root(9)).to eq(9)
  end

  it "calculates the digital root of a larger number" do
    expect(digital_root(4322)).to eq(2)
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
    expect(factorial(2)).to eq(2) # = [0!, 1!]
  end

  it "returns many factorials numbers" do
    expect(factorial(6)).to eq(720)
  end

  it "calls itself recursively" do
    expect(self).to receive(:factorial).at_least(:twice).and_call_original
    factorial(6)
  end
end

describe "#n_factorials" do
  it "returns first factorial number" do
    expect(n_factorials(1)).to eq([1])
  end

  it "returns first two factorial numbers" do
    expect(n_factorials(2)).to eq([1, 1]) # = [0!, 1!]
  end

  it "returns many factorials numbers" do
    expect(n_factorials(6)).to eq([1, 1, 2, 6, 24, 120])
    # == [0!, 1!, 2!, 3!, 4!, 5!]
  end

  it "calls itself recursively" do
    expect(self).to receive(:n_factorials).at_least(:twice).and_call_original
    n_factorials(6)
  end
end
