require('sinatra')
require('sinatra/reloader')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')
also_reload('../models/*')

get '/artists' do
  erb(:"artists/index")
end

get '/artists/new' do
  erb(:"artists/new")
end

get '/artists/:id' do
  @artist = Artist.find_by_id(params[:id])
  erb(:"artists/show")
end

post '/artists' do
  artist = Artist.new(params)
  artist.save()
  redirect to('/artists')
end
