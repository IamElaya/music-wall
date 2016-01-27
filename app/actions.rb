# Homepage (Root path)

helpers do
  def current_user
    User.find { |u| u[:id] == session[:user_id] } if session[:user_id]
  end

    def log_in(user)
    session[:user_id] = user.id
  end
end

get '/' do
  # @foo = session["foo"]
  erb :index
end

get '/songs' do

  @songs = Song.all.order(upvotes: :desc)

  # session["foo"] = "ashshdahdsadhsajd"
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

  get '/sign_up' do
    # session["user"] = params[:name]
    # redirect '/'
    @users = User.all
    erb :'sign_up'
  end

post '/sign_up' do
  @user = User.new(
    email: params[:email],
    user_name: params[:user_name],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect '/songs' 
  else
    erb :'sign_up'
  end
end

  get '/log_in' do
    # session["user"] = params[:name]
    # redirect '/'
    @users = User.all
    erb :'log_in'
  end

  post '/log_in' do
   user = User.find { |u| u[:email] == params[:email] }
  if user && user[:password] == params[:pword]
    session[:user_id] = user[:id]
    redirect '/songs' 
  end
  # end
  # else
  #   erb :'sign_up'
  # end
end

get '/log_out' do
  session.clear
  redirect '/songs'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  @reviews = @song.reviews
  erb :'songs/show'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    url: params[:url],
    author: params[:author],
    user_id: current_user.id
    )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

# get '/review' do
#     @reviews = Review.all(
#       erb :

# end

get '/review' do
    @reviews = Review.all
  erb :'songs/show'
end

post '/review' do
   @song = Song.find params[:id]
    @review = Review.new(
      user_id: current_user.id,
      song_id: @song.id,
      userreview: params[:comment],
      rating_field: params[:rating]
      )
   if  @review.save
   @song.save
    redirect '/songs'
#   else
#     erb :'songs/new'
#   end
end
end

get '/delete' do
  @reviews = Review.all
  @reviews.each do |review|
    if review.user_id == current_user.id
      review.destroy
    end
  end
 redirect '/songs'
end

  get '/like' do
    @song = Song.find params[:id]
    @like = Like.new(
      user_id: current_user.id,
      song_id: @song.id
      )
    if @like.save
    @song.upvotes += 1
    @song.save
    redirect '/songs'
    
  end
  end
