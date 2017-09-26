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
  @available_products = Product.available
  @unavailable_products = Product.unavailable
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
  @products = Product.available
  erb(:cashier)
end

post('/cashier') do
  if params['product_ids']
    product_ids = params['product_ids'].map { |id| id.to_i }
  else
    product_ids = nil
  end
  @purchase = Purchase.create({
    customer: params['customer'],
    product_ids: product_ids,
    date: Date.today
  })
  erb(:purchase_slip)
end

get('/purchase/:id/edit') do
  @purchase = Purchase.find(params[:id].to_i)
  @products = @purchase.products + Product.available
  erb(:purchase_edit)
end

patch('/purchase/:id/edit') do
  @purchase = Purchase.find(params[:id].to_i)
  if params['product_ids']
    product_ids = params['product_ids'].map { |id| id.to_i }
  else
    product_ids = nil
  end
  @purchase.update({customer: params['customer'], product_ids: product_ids})
  erb(:purchase_slip)
end

delete('/purchase/:id/delete') do
  @purchase = Purchase.find(params[:id].to_i)
  @purchase.update({product_ids: nil})
  @purchase.destroy
  redirect '/cashier'
end

get('/transactions') do
  @purchases = Purchase.all
  erb(:transactions)
end

post('/transactions') do
  @purchases = Purchase.all
  start_date = Date.parse(params["start-date"])
  end_date = Date.parse(params["end-date"])
  @sales_total = Purchase.sales_total(start_date, end_date)
  erb(:transactions)
end

get('/transactions/:id') do
  @purchase = Purchase.find(params[:id].to_i)
  erb(:transaction_detail)
end
