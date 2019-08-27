require('sinatra')
require('sinatra/reloader')
require('sinatra/contrib/all')
require_relative('../models/product.rb')
require_relative('../models/artist.rb')
also_reload('../models/*')

get '/products' do
  @products = Product.all()
  @artists = Artist.all()
  erb(:"products/index")
end

get '/products/new' do
  @artists = Artist.all()
  erb(:"products/new")
end

get '/products/:id' do
  @product = Product.find_by_id(params[:id])
  erb(:"products/show")
end

post '/products' do
  params[:buying_cost] = Product.convert_to_pence(params[:buying_cost])
  params[:sale_price] = Product.convert_to_pence(params[:sale_price])
  product = Product.new(params)
  product.save()
  redirect to("/products/#{product.id()}")
end

get '/products/:id/edit' do
  @product = Product.find_by_id(params[:id])
  @artists = Artist.all()
  erb(:"products/edit")
end

post '/products/filter' do
  redirect to("/products/filter/#{params[:artist_id]}")
end

get '/products/filter/:id' do
  @artist = Artist.find_by_id(params[:id])
  @artists = Artist.all()
  erb(:"products/filter")
end

post '/products/:id' do
  params[:buying_cost] = Product.convert_to_pence(params[:buying_cost])
  params[:sale_price] = Product.convert_to_pence(params[:sale_price])
  product = Product.new(params)
  product.update()
  redirect to("/products/#{product.id()}")
end

post '/products/:id/delete' do
  product = Product.find_by_id(params[:id])
  product.delete()
  redirect to("/products")
end
