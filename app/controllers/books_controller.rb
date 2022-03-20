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

    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      redirect_to '/books'
    end
    #データをデータベースに保存するためのsaveメソッド実行
    #book.save
    #詳細画面へリダイレクト
    #redirect_to book_path(book.id)
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    # 保存済みのデータが必要なので、findでデータを取得し、@bookに収納
    @book = Book.find(params[:id])
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
