require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest

  new_book_params =  { book: { author: "Terry Pratchett",
                               title: "Guards! Guards!",
                               pub_year: 1989 } }

  def setup
    @user = users(:user1)
    @book = books(:book1)
  end

  test 'should get index and render template' do
    get books_url
    assert_response :success
    assert_template 'books/index'
  end

  test 'should get show and render template' do
    get book_url(@book)
    assert_response :success
    assert_template 'books/show'
  end

  test 'should redirect new when not signed in' do
    get new_book_url
    assert_redirected_to new_user_session_url
  end

  test 'should get new when signed in' do
    sign_in @user
    get new_book_url
    assert_template 'books/new'
  end

  test 'should redirect create when not signed in' do
    assert_no_difference "Book.count" do
      post books_url, params: new_book_params
    end
    assert_redirected_to new_user_session_url
  end

  test 'should create new book when signed in' do
    sign_in @user
    assert_difference "Book.count", 1 do
      post books_url, params: new_book_params
    end
  end

  test 'should redirect destroy when not signed in' do
    assert_no_difference "Book.count" do
      delete book_url(@book)
    end
    assert_redirected_to new_user_session_url
  end

  test 'should delete book when signed in' do
    sign_in @user
    assert_difference "Book.count", -1 do
      delete book_url(@book)
    end
    assert_redirected_to books_url
  end

  test 'should redirect edit when not signed in' do
    get edit_book_url(@book)
    assert_redirected_to new_user_session_url
  end

  test 'should get edit when signed in' do
    sign_in @user
    get edit_book_url(@book)
    assert_template 'books/edit'
  end

  test 'should redirect update when not signed in' do
    patch book_url(@book), params: new_book_params
    assert_not flash.empty?
    assert_redirected_to new_user_session_url
    assert_equal @book.updated_at, @book.reload.updated_at
  end

  test 'should update book when signed in' do
    sign_in @user
    patch book_url(@book), params: new_book_params
    assert_equal @book.reload.author, new_book_params[:book][:author]
  end

end
