# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'haml'

get '/' do
  haml :index
end

get '/tasks/new' do
  haml :new
end

get '/tasks/edit' do
  haml :edit
end

get '/tasks/1' do
  haml :show
end
