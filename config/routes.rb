Rails.application.routes.draw do
  get 'books/:id' => 'books#show', as: 'book' #booksコントローラーのshowアクションをbookとする
  get '/' => "homes#top"
  get 'books' => "books#index"
  post 'books' => 'books#create'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book' #booksコントローラーのeditアクションをedit_bookとする
  resources :books
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
