class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_gon
  before_action :set_search

  add_flash_types :success, :info, :warning, :danger

  # CSRF対策
  protect_from_forgery

  private

  def set_gon
    gon.domain = ENV['DOMAIN']
  end

  def set_search
    @search = Book.ransack(params[:q])
    @search_books = @search.result
  end

  def set_upvote_chart
    books = Book.upvotes(@user)
    book_categories = Book.pickup_category_name(books)
    @upvote_categories = book_categories.uniq
    @upvote_datas = Category.how_many_contains(book_categories, @upvote_categories)

    gon.upvote_categories = @upvote_categories
    gon.upvote_datas = @upvote_datas
    @upvote_count = @user.upvotes.count
  end

  def set_borrowed_chart
    books = Book.borrowed(@user)
    book_categories = Book.pickup_category_name(books)
    @borrowed_categories = book_categories.uniq
    @borrowed_datas = Category.how_many_contains(book_categories, @borrowed_categories)

    gon.borrowed_categories = @borrowed_categories
    gon.borrowed_datas = @borrowed_datas
    @borrowed_count = @user.borrow_lists.count
  end

  # ログイン後のリダイレクト先をオーバーライド
  def after_sign_in_path_for(_resource)
    root_path
  end

  # ログアウト後のリダイレクト先をオーバーライド
  def after_sign_out_path_for(_resource)
    root_path
  end
end
