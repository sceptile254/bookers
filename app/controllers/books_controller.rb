class BooksController < ApplicationController

  def new

  end

  def index
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
    #すべてのデータを取得し、@booksに格納
    @books = Book.all
  end

  def create #createアクションを定義
    #データを受け取り新規登録するためのインスタンス
    book = Book.new(book_params)
    #データをデータベースに保存するためのsaveメソッド実行
    book.save
    #トップ画面へリダイレクト
    redirect_to '/'
  end


  def show
  end

  def edit
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
