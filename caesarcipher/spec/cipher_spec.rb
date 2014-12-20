require_relative '../caesarcipher'

describe "returns a correct cipher based on key" do
  p = caesar_cipher("abcdef", 1)
  p.should eql "bcdefg"
end
