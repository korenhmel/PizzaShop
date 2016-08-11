#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
# require "sinatra/reloader"
after do
  ActiveRecord::Base.connection.close
end


set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base

end

class Order < ActiveRecord::Base

end


get '/' do
  @products = Product.all

  erb :index
end

get '/about' do
  erb :about
end
# get '/cart' do
#   @c = Order.new
#   erb :cart
# end
post '/cart' do

 # получаем список параметров и разбираем (parse) их

  orders_input = params[:orders_input]

  @items = pars_orders_line(orders_input)

  # выводим сообщение о то что корзина пуста

  if @items.length == 0
    return erb :empty_cart
  end

  # выводим список продуктов в корзине

  @items.each do |item|
    item[0] = Product.find(item[0])
  end

  # возвращаем представление по умолчанию

erb :cart
end

def pars_orders_line(orders_input)

  s1= orders_input.split(/;/)

  arr = []
  s1.each do |x|
    x2 = x.split(/\=/)

    x3  = x2[0].split(/\_/)
    id  = x3[1]
    cnt = x2[1]

    arr2 = [id, cnt]

    arr.push arr2
    if arr2 == [nil, nil]
      arr.pop
    end

  end
  return arr
end

post '/place_order' do
  @c = Order.create params[:order]

  @message = " спасибо вы записались"

  erb :orders
end


