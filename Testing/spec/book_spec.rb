require 'spec_helper'


describe Book do

  before :each do
    @book = Book.new "Title", "Author", "Category"
  end

  describe "#new" do
    it"returns a new book object" do
      @book.should be_an_instance_of Book
    end

    it "takes three paraments and returns a book object" do
      lambda { Book.new "title", "author"}.should raise_exception ArgumentError
    end
  end

  describe "#title" do
    it "returns the correct title" do
      @book.title.should eql "Title"
    end
  end
  describe "#title" do
      it "returns the correct author" do
      @book.author.should eql "Author"
    end
  end
  describe "#title" do
    it "returns the correct category" do
      @book.category.should eql "Category"
    end
  end

end
