Rails.application.routes.draw do
  get '/books' => "books#index"
  post 'books' => 'books#create'
  get 'books/new'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  get 'new/index'
  get 'new/show'
  get 'new/edit'
  get '/' => "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
