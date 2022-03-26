# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'haml'
require_relative 'memos'

memos = Memos.new

get '/' do
  @memos = memos.all
  haml :index
end

get '/memos/new' do
  haml :new
end

get '/memos/:id' do
  @memo = memos.find(params[:id])
  haml :show
end

get '/memos/:id/edit' do
  @memo = memos.find(params[:id])
  haml :edit
end

post '/memos' do
  memos.create(params[:title], params[:content])
  redirect to '/'
end

patch '/memos/:id' do
  memos.update(params[:title], params[:content], params[:id])
  redirect to "/memos/#{params[:id]}"
end

delete '/memos/:id' do
  memos.destroy(params[:id])
  redirect to '/'
end
