require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
also_reload('lib/**/*.rb')
require "./lib/product"
require "./lib/purchase"
require "pg"
require "pry"

get('/') do
  erb(:index)
end
