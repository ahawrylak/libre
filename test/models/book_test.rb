require 'test_helper'

class BookTest < ActiveSupport::TestCase

  def setup
    @book = Book.new( author: "George Orwell",
                      title: "Harry Potter and the Order of the Phoenix",
                      pub_year: 1345,
                      description: Faker::Lorem.paragraph(10) )
    assert @book.valid?
  end

  test 'author should be present' do
    @book.author = nil
    assert @book.invalid?
  end

  test 'author should not be blank' do
    @book.author = '  '
    assert @book.invalid?
  end

  test 'author should be less than 70 characters' do
    @book.author = 'a' * 70
    assert @book.invalid?
  end

  test 'title should be present' do
    @book.title = nil
    assert @book.invalid?
  end

  test 'title should not be blank' do
    @book.title = ' '
    assert @book.invalid?
  end

  test 'title should be less than 200 characters' do
    @book.title = 'a' * 200
    assert @book.invalid?
  end

  test 'pub_year should be present' do
    @book.pub_year = nil
    assert @book.invalid?
  end

  test 'pub_year should not be blank' do
    @book.pub_year = ' '
    assert @book.invalid?
  end

  test 'pub_year should be between 0 and 2020' do
    @book.pub_year = -1
    assert @book.invalid?
    @book.pub_year = 2021
    assert @book.invalid?
  end

  test 'no or blank description should generate default description' do
    book = Book.new(author: "Jane Austen", title: "Something", pub_year: 2000)
    book.valid?
    assert_equal "No description", book.description
    book = Book.new(author: "Jane Austen", title: "Something", pub_year: 2000, description: " ")
    book.valid?
    assert_equal "No description", book.description
  end

  test 'description should be less than 2000 characters' do
    @book.description = 'a' * 2000
    assert @book.invalid?
  end

end
