Rails.application.routes.draw do
  post 'upload_file' => 'amazon_s3#upload'
  get 'view_file' => 'amazon_s3#download'

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
