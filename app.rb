require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/artists_controller.rb')
require_relative('controllers/products_controller.rb')
also_reload('./models/*')

get '/' do
  erb(:index)
end
