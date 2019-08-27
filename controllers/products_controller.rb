require('sinatra')
require('sinatra/reloader')
require('sinatra/contrib/all')
require_relative('../models/product.rb')
also_reload('../models/*')

get '/products' do
  @products = Product.all()
  erb(:"products/index")
end

get '/products/new' do
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
  erb(:"products/edit")
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
