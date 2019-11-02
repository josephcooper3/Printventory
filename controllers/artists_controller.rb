require('sinatra')
require('sinatra/reloader')
require('sinatra/contrib/all') if development?
require_relative('../models/artist.rb')

get '/artists' do
  @artists = Artist.all()
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
  redirect to("/artists/#{artist.id()}")
end

get '/artists/:id/edit' do
  @artist = Artist.find_by_id(params[:id])
  erb(:"artists/edit")
end

post '/artists/:id' do
  artist = Artist.new(params)
  artist.update()
  redirect to("/artists/#{artist.id()}")
end

post '/artists/:id/delete' do
  artist = Artist.find_by_id(params[:id])
  artist.delete()
  redirect to('/artists')
end
