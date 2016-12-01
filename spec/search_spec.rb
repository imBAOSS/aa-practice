require 'rspec'
require 'search'

describe "#binary_search" do
  let(:array) { [1, 3, 4, 5, 7] }

  it "returns nil if the array is empty" do
    expect([].binary_search(2)).to eq(nil)
  end

  it "finds the index if the element is in the center" do
    expect(array.binary_search(4)).to eq(2)
  end

  it "finds the index in the element is lesser than the center" do
    expect(array.binary_search(3)).to eq(1)
  end

  it "finds the index in the element is greater than the center" do
    expect(array.binary_search(5)).to eq(3)
  end

  it "returns nil if the element cannot be found" do
    expect(array.binary_search(2)).to eq(nil)
  end

end
