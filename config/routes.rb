Rails.application.routes.draw do
  get '/' => "homes#top"
  resources :books
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
