require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/artist_controller.rb')
require_relative('controllers/product_controller.rb')
also_reload('./models/*')

get '/' do
  erb(:index)
end
