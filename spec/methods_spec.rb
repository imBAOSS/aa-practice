require 'rspec'
require 'methods'

describe Array do
  describe '#my_each' do
    it 'calls the block passed to it' do
      expect do |block|
        ["test array"].my_each(&block)
      end.to yield_control.once
    end

    it 'yields each element to the block' do
      expect do |block|
        ["el1", "el2"].my_each(&block)
      end.to yield_successive_args("el1", "el2")
    end

    it 'does NOT call the Array#each method' do
      original_array = ["original array"]
      expect(original_array).not_to receive(:each)
      original_array.my_each {}
    end

    it 'is chainable and returns the original array' do
      original_array = ["original array"]
      expect(original_array.my_each {}).to eq(original_array)
    end
  end

  describe '#my_inject' do

    it 'calls the block passed to it' do
      expect do |block|
        ["test array"].my_inject(:dummy, &block)
      end.to yield_control.once
    end

    it 'makes the first element the accumulator if no default is given' do
      expect do |block|
        ["el1", "el2", "el3"].my_inject(&block)
      end.to yield_successive_args(["el1", "el2"], [nil, "el3"])
    end

    it 'yields the accumulator and each element to the block' do
      expect do |block|
        [1, 2, 3].my_inject(100, &block)
      end.to yield_successive_args([100, 1], [nil, 2], [nil, 3])
    end

    it 'does NOT call the built in Array#inject method' do
      original_array = ["original array"]
      expect(original_array).not_to receive(:inject)
      original_array.my_inject {}
    end

    it 'with accumulator, it correctly injects and returns answer' do
      expect([1, 2, 3].my_inject(1) { |acc, x| acc + x }).to eq(7)
      expect([3, 3].my_inject(3) { |acc, x| acc * x }).to eq(27)
    end

    it 'without accumulator, it correctly injects and returns answer' do
      expect([1, 2, 3].my_inject { |acc, x| acc + x }).to eq(6)
      expect([3, 3].my_inject { |acc, x| acc * x }).to eq(9)
    end
  end

  describe "#my_map" do
    it "calls the block passed to it" do
      expect do |block|
        ["test array"].my_map(&block)
      end.to yield_control.once
    end

    it "yields each element to the block" do
      expect do |block|
        ["el1", "el2"].my_map(&block)
      end.to yield_successive_args("el1", "el2")
    end

    it "runs the block for each element" do
      expect([1, 2, 3].my_map { |el| el * el }).to eq([1, 4, 9])
      expect([-1, 0, 1].my_map { |el| el.odd? }).to eq([true, false, true])
    end

    it "does NOT call the built in built-in #map method" do
      original_array = ["original array"]
      expect(original_array).not_to receive(:map)
      original_array.my_map {}
    end

    it "is chainable and returns a new array" do
      original_array = ["original array"]
      expect(original_array.my_map {}).not_to eq(original_array)
    end
  end

  describe "#my_select" do
    it "calls the block passed to it" do
      expect do |block|
        ["test element"].my_select(&block)
      end.to yield_control
    end

    it "yields each element to the block" do
      test_array = ["el1", "el2", "el3"]
      expect do |block|
        test_array.my_select(&block)
      end.to yield_successive_args("el1", "el2", "el3")
    end

    it "returns an array of filtered down items" do
      test_array = [1, 2, 3, 4, 5]
      expect(test_array.my_select(&:odd?)).to eq([1, 3, 5])
      expect(test_array.my_select { |el| el < 3 }).to eq([1, 2])
    end

    it "does NOT call the built-in #select method" do
      test_array = ["el1", "el2", "el3"]
      expect(test_array).not_to receive(:select)
      test_array.my_select {}
    end
  end

  describe "#my_uniq" do
    let(:array) { [1, 2, 1, 3, 4, 2] }

    it "returns the unique elements" do
      expect(array.my_uniq).to eq([1, 2, 3, 4])
    end

    it "does not modify the original array" do
      duped_array = array.dup

      array.my_uniq

      expect(array).to eq(duped_array)
    end

    it "does not call the built-in #uniq method" do
      expect(array).not_to receive(:uniq)

      array.my_uniq
    end
  end

  describe "#my_transpose" do
    let(:arr) { [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ] }

    let(:small_arr) { [
      [1, 2],
      [3, 4]
    ] }

    it "transposes a small matrix" do
      expect(small_arr.my_transpose).to eq([
        [1, 3],
        [2, 4]
      ])
    end

    it "transposes a larger matrix" do
      expect(arr.my_transpose).to eq([
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9]
      ])
    end

    it "should not modify the original array" do
      small_arr.my_transpose

      expect(small_arr).to eq([
        [1, 2],
        [3, 4]
      ])
    end

    it "should not call the built-in #transpose method" do
      expect(arr).not_to receive(:transpose)

      arr.my_transpose
    end

    it "should transpose rectangular arrays" do
      rect = [[1,2,3],
              [4,5,6]]
      expect(rect.my_transpose).to eq([[1,4],
                                       [2,5],
                                       [3,6]])
    end
  end
end

describe MyHashSet do
  let(:set1) { MyHashSet.new }
  let(:set2) { MyHashSet.new }
  let(:set3) { MyHashSet.new }
  let(:set4) { MyHashSet.new }
  let(:set5) { MyHashSet.new }

  describe "#include?" do
    context "when the element has been inserted" do
      it "returns true" do
        set1.insert("foo")

        expect(set1.include?("foo")).to be_truthy
      end
    end

    context "when the element has not been inserted" do
      it "returns false" do
        expect(set1.include?("foo")).to be_falsey
      end
    end
  end

  describe "#delete" do
    it "removes an element from the set" do
      set1.insert("bar")
      expect(set1.include?("bar")).to be_truthy

      set1.delete("bar")

      expect(set1.include?("bar")).to be_falsey
    end
  end

  describe "#to_a" do
    it "returns an array" do
      expect(set1.to_a).to be_an(Array)
    end

    it "returns an array containing each element of the set" do
      elements = %w(Hydrogen Helium Lithium Beryllium)
      elements.each { |el| set1.insert(el) }

      expect(set1.to_a).to contain_exactly(*elements)
    end
  end

  describe "set interaction methods" do
    before(:each) do
      set1.insert("Mark Hamill")
      set1.insert("Harrison Ford")
      set1.insert("Anthony Daniels")

      set2.insert("Ewan McGregor")
      set2.insert("Natalie Portman")
      set2.insert("Anthony Daniels")

      set3.insert("Mark Hamill")
      set3.insert("Harrison Ford")
      set3.insert("Anthony Daniels")

      set4.insert("Mark Hamill")
      set4.insert("Harrison Ford")
      set4.insert("Natalie Portman")

      set5.insert("Mark Hamill")
      set5.insert("Harrison Ford")
      set5.insert("Anthony Daniels")
      set5.insert("Natalie Portman")
    end

    describe "#union" do
      it "returns a new set" do
        expect(set1.union(set2)).to be_a(MyHashSet)
      end

      it "returns a set containing elements in EITHER set" do
        els = set1.union(set2).to_a

        expect(els).to contain_exactly(
          "Mark Hamill",
          "Harrison Ford",
          "Anthony Daniels",
          "Ewan McGregor",
          "Natalie Portman"
        )
      end
    end

    describe "#intersect" do
      it "returns a new set" do
        expect(set1.intersect(set2)).to be_a(MyHashSet)
      end

      it "returns a set containing elements in BOTH sets" do
        els = set1.intersect(set2).to_a

        expect(els).to contain_exactly("Anthony Daniels")
      end
    end

    describe "#minus" do
      it "returns a new set" do
        expect(set1.minus(set2)).to be_a(MyHashSet)
      end

      it "returns a set containing elements ONLY in the first set" do
        els = set1.minus(set2).to_a

        expect(els).to contain_exactly(
          "Mark Hamill",
          "Harrison Ford"
        )
      end
    end

    describe "#symmetric_difference" do
      it "returns a new set" do
        expect(set1.minus(set2)).to be_a(MyHashSet)
      end

      it "returns a set containing elements ONLY in the first set" do
        els = set1.symmetric_difference(set2).to_a

        expect(els).to contain_exactly(
          "Mark Hamill",
          "Harrison Ford",
          "Natalie Portman",
          "Ewan McGregor"
        )
      end
    end

    describe "#==" do
      it "returns true if the objects have the same content" do
        expect(set1 == set3).to be_truthy
      end

      it "returns false if the objects do not have the same content" do
        expect(set1 == set4).to be_falsey
      end

      it "returns false if the objects do not have the same length" do
        expect(set1 == set5).to be_falsey
      end
    end

  end
end
