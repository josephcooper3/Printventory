require('sinatra')
require('sinatra/reloader')
require('sinatra/contrib/all') if development?
require_relative('controllers/artists_controller.rb')
require_relative('controllers/products_controller.rb')

get '/' do
  erb(:index)
end
