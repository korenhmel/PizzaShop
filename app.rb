#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
 # require "sinatra/reloader"

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base

end



get '/' do
  @products = Product.all

	erb :index
end

get '/about' do
  erb :about
end
get '/cart' do
  erb :cart
end
post '/cart' do
   orders_input = params[:orders]
     @orders2 = pars_orders_line(orders_input)
   erb  :cart
end

def pars_orders_line(orders_input)

  s1= orders_input.split(/;/)

  arr = []
  s1.each do |x|
    x2 = x.split(/\=/)

    x3  = x2[0].split(/\_/)
    id = x3[1]
    cnt = x2[1]
    arr2 = [id, cnt]
    arr.push arr2
    arr = arr.first(3)
  end
  return arr
end

post '/orders' do

erb  :orders
end

# show_regexp('I should see "Hello Cucumber!"', /"[^"]*"$/)
# show_regexp("это стоит дохрена и трошки", /стоит/)
# show_regexp("it cost $344.347 dollars", /\$\d*\.\d\d/)
