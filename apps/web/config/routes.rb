# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage

get '/books', to: 'books#index', as: :books
get '/', to: 'home#index', as: :home
