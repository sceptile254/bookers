Rails.application.routes.draw do
  get 'books/:id' => 'books#show'
  get '/' => "homes#top"
  get 'books' => "books#index"
  post 'books' => 'books#create'
  resources :books
end
