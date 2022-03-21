class BooksController < ApplicationController

  def new
    # @book = Book.new
  end

  def index
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
    #すべてのデータを取得し、@booksに格納
    @books = Book.all
  end

  def create
    #データを受け取り新規登録するためのインスタンス
    # @book = Book.new(book_params)
    @book = Book.new(book_params)

    if @book.save
      #投稿に成功した時の処理
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      #投稿失敗時の処理]
      @books = Book.all
      render :index
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

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book.id)
    else
      #更新失敗時の処理
      @book = book
      render :edit
    end

  end

  def destroy
    book = Book.find(params[:id]) #レコードを1件取得し、bookに格納

    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to '/books'
    else
      flash[:notice] = "Book was NOT successfully destroyed."
      redirect_to '/books'
    end
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
