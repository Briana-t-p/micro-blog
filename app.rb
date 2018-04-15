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

#this finds the current user from their id
def current_user
    if session[:user_id]
        @current_user = User.find(session[:user_id])
    end
end

#this puts all the newest posts on the homepage
get '/' do
  @users = User.all
  @posts = Post.all
  erb :home
end

#this lets you create a new profile
post '/users/new' do
    puts "****************************"
    puts params
    puts "****************************"
    User.create(params[:post])
    redirect "/"
end

#this is how you add new recipes
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

#when you sign in this takes you to your individual profile page
get '/user/:id' do
  erb :profile
end

#this puts all your posts on your profile
get '/profile' do
  @post = Post.all
 erb :profile
end

#this checks your password when you sign in
post '/profile' do
    @user = User.where(fname: params[:fname]).first
    if @user.password == params[:password]
        session[:user_id] = @user.id
        redirect "/user/#{@user.id}"
      end
end

#this is for editing your profile. we didnt finish this one
get '/edit' do
  erb :edit
end

#this deletes user account
def delete_user
  current_user
  if current_user
    @current_user_id = @current_user.id
    @current_user.destroy
    session[:user_id] = nil
  end
end

#this is how you delete your account
get '/delete' do 
  current_user
  delete_user
  erb :delete
end

#this is how you view other users' profiles
get '/member/:id' do
  @user = User.find(params[:id])
  puts params.inspect
  erb :member
end

#this resets to the homepage with user_id made blank so you are signed out
get '/sign_out' do
      session[:user_id] = nil
  redirect "/"
  erb :sign_out
end

#this is if there is an error in signing in
get '/error' do
  erb :error
end
