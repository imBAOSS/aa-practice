require 'rspec'
require 'sort'

describe "#bubble_sort" do
  let(:bubble_array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].bubble_sort!).to eq([])
  end

  it "works with an array of one item" do
    expect([1].bubble_sort!).to eq([1])
  end

  it "sorts numbers" do
    expect(bubble_array.bubble_sort).to eq(bubble_array.sort)
  end

  it "will use a block if given" do
    reversed = bubble_array.bubble_sort! do |num1, num2|
      # Reverse Order
      num2 <=> num1
    end
    expect(reversed).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify the original array" do
    duped_array = bubble_array.dup
    bubble_array.bubble_sort
    expect(duped_array).to eq(bubble_array)
  end
end

describe "#merge_sort" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].merge_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].merge_sort).to eq([1])
  end

  it "sorts numbers" do
    expect(array.merge_sort).to eq(array.sort)
  end

  it "will use block if given" do
    reversed = array.merge_sort do |num1, num2|
      # Reverse Order
      num2 <=> num1
    end
    expect(reversed).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify the original array" do
    duped_array = array.dup
    duped_array.merge_sort
    expect(duped_array).to eq(array)
  end
end

describe "#quick_sort" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].quick_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].quick_sort).to eq([1])
  end

  it "sorts numbers" do
    expect(array.quick_sort).to eq(array.sort)
  end

  it "will use block if given" do
    reversed = array.quick_sort do |num1, num2|
      # Reverse Order
      num2 <=> num1
    end
    expect(reversed).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify the original array" do
    duped_array = array.dup
    duped_array.quick_sort
    expect(duped_array).to eq(array)
  end
end
