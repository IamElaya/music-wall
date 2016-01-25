# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  erb :'songs/new'
end

get '/songs/:id' do
  @songs = Song.find params[:id]
  erb :'songs/show'
end

post '/songs' do
  @songs = Song.new(
    title: params[:title],
    url: params[:url],
    author: params[:author]
    )
  @songs.save
  redirect '/songs'
end