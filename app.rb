require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'sinatra/flash'
require './models'
enable :sessions

set :database, "sqlite3:micro_blog.sqlite3"

get '/' do
  erb :home
end

get '/post' do
  erb :post
end

get '/profile' do
  erb :profile
end

get '/edit' do
  erb :edit
end

get '/delete' do
  erb :delete
end
