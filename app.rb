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
   # @orders = params['orders1']
   # @orders2 = items_from_orders(@orders)

 erb  :cart
end
# def items_from_orders(string)
#   elem =  string.scan(/[product\_\d\=\s\d]+/)
#   arr = []
#   elem.each do |el|
#     take_digits = el.scan(/[product\_\d]+/)
#     digits = take_digits[1]
#     number = take_digits[0]
#     arr2= [number.to_s, digits.to_s]
#     arr.push arr2
#   end
#   p arr
# end










post '/orders' do

erb  :orders
end

# show_regexp('I should see "Hello Cucumber!"', /"[^"]*"$/)
# show_regexp("это стоит дохрена и трошки", /стоит/)
# show_regexp("it cost $344.347 dollars", /\$\d*\.\d\d/)
