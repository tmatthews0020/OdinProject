require 'spec_helper'


describe "Library Object" do

  before :all do
    lib_arr = [
      Book.new("book", "author", :development)
    ]

    File.open "books.yml", "w" do |f|
      f.write YAML::dump lib_arr
    end
  end

  before :each do
    @lib = Library.new "books.yml"
  end

  describe "#new" do
    context "with no parameters" do
      it "should have bo books" do
        lib = Library.new
        lib.books.should eq([])
    end
  end

    context "with a yaml file name parameter" do
      it "has one book" do
        @lib.books.length.should eq(1)
      end
    end
  end

  it "returns all the books in a given category" do
    @lib.get_books_in_category(:development).length.should == 1
  end

  it "accepts new books" do
    @lib.add_book( Book.new("designing for the web", "mark boulton", :design))
    @lib.get_book("designing for the web").should be_an_instance_of Book
  end

  it "saves the library" do
    books = @lib.books.map {|book| book.title}
    @lib.save "our_new_library.yml"
    lib2 = Library.new "our_new_library.yml"
    books2 = lib2.books.map {|book| book.title}
    books.should eql books2
  end

end
