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

get('/manager') do
  @products = Product.all
  erb(:manager)
end

post('/manager') do
  # Product.create({:description => params.fetch('description'), :price => params.fetch('price').to_f})
  Product.create({description: params['description'], price: params['price'].to_f})
  redirect '/manager'
end

get('/product/:id') do
  @product = Product.find(params[:id].to_i)
  erb(:product)
end

get('/product/:id/edit') do
  @product = Product.find(params[:id].to_i)
  erb(:product_edit)
end

patch('/product/:id/edit') do
  @product = Product.find(params[:id].to_i)
  @product.update({description: params['description'], price: params['price'].to_f})
  redirect "/product/#{@product.id}"
end

delete('/product/:id/delete') do
  @product = Product.find(params[:id].to_i)
  @product.destroy
  redirect "/manager"
end

get('/cashier') do
  @products = Product.all
  erb(:cashier)
end

post('/cashier') do
  erb(:cashier)
end
