require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'sinatra/flash'
require './models'
enable :sessions

set :database, "sqlite3:micro_blog.sqlite3"

before do
  puts current_user
end

def current_user
    if session[:user_id]
        @current_user = User.find(session[:user_id])
    end
end


get '/' do
  @users = User.all
  @posts = Post.all
  erb :home
end


post '/users/new' do
    puts "****************************"
    puts params
    puts "****************************"
    User.create(params[:post])
    redirect "/"
end

post '/posts/new' do
  puts "****************************"
  puts params
  puts "****************************"
  Post.create(params[:post])
  redirect '/'
end

get '/post' do
  erb :post
end

get '/user/:id' do
  erb :profile
end

=begin
get '/profile' do
  @post = Post.all
  erb :profile
end
=end


post '/profile' do
    @user = User.where(fname: params[:fname]).first
    if @user.password == params[:password]
        session[:user_id] = @user.id
        redirect "/user/#{@user.id}"
      end
end

get '/edit' do
  erb :edit
end

get '/delete' do
  erb :delete
end

get '/member/:id' do
  erb :member
end
