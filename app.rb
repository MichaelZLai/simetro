require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/start' do
  params[:line]
  @stations = metro[params[:line].to_sym]
  erb :start
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end

get '/trip' do
  @lines = params[:line].to_sym
  @start = params[:start].to_s
  @end = params[:end].to_s
  @starti = metro[@lines].index(@start)
  @endi = metro[@lines].index(@end)
  @num_stops = @endi - @starti
  erb :trip
end
