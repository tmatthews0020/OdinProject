require_relative 'spec_helper'


describe "#caesar_cipher" do
  it "should cipher" do
    p = caesar_cipher("abcdef", 1)
    expect(p).to eql("bcdefg")
  end
end
