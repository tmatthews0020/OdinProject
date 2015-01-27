

describe "#my_each" do
  it "should return empty array" do
    array = []
    new_array = array.my_each
    expect(new_array).to eql(array)
  end

  it "should accept array of numbers" do
    counter = 0
    array = [1,2,3]
    array.my_each do |x|
        expect(x).to eql(array[counter])
        counter += 1
      end
  end
end

describe "#my_each_with_index" do
    it "should return empty array" do
      array = []
      new_array = array.my_each_with_index
      expect(new_array).to eql(array)
    end

    it "should accept array of numbers" do
      counter = 0

      array = [1,2,3]
      array.my_each_with_index do |value, index|
          expect(value).to eql(array[index])
          counter += 1
        end
    end
end


describe "#my_all?" do
  it "should return true if empty" do
    array = []
    expect(array.my_all?).to eql(true)
  end
  it "should return false if not all match" do
    array = [1,2,3]
    expect(array.my_all? {|x| x.class == Hash}).to eql(false)
  end
  it "should return true if all match" do
    array = [1,2,3]
    expect(array.my_all? {|x| x.class == Fixnum}).to eql(true)
  end
end
