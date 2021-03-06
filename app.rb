require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

#0.1 Дополнить Gemfile описанием зависимостей гемов
#0.2 Запускаем в командной строке bundle install (установка необхожимых гемов)

#1. Подключаем активрекорд 
require 'sinatra/activerecord'

#2. Создаем подключение к бд
set :database, "sqlite3:pizzashop.db"

#3. Создаем модель имя в ед. числе
class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
	validates :orders_input, presence: true
	validates :name, presence: true, length: { minimum: 3}
	validates :phone, presence: true
	validates :address, presence: true
end

#4. Создаем Rakefile в папке с app.rb для создания миграции
#(это руби фаил который подключает необходимый неймспейсы)

#5. Запускаем rake команды которые создают базу под нужную версию программы

#5.1 rake db:create_migration NAME=create_products - (имя во мн. ч.) создает фаил новой миграции для продуктов  в db/migrate/
#заходим в созданную миграцию в папке db и в методе change описываем модель (таблицу)

#5.2 rake db:migrate - применяет (выполняет) созданную миграцию (грубо говоря в этот момент создаются таблицы в бд и сама бд)
#физически создается таблица и бд

#5.3 Создадим миграцию которая ноплняет таблицу данными
#rake db:create_migration NAME=add_products - создает фаил новой миграции в db/migrate/
#заходим в созданную миграцию в папке db и в методе change наполняем модель (таблицу)

#rake db:rollback - возврат к передыдущей миграции


get '/' do
 	erb :index
end

get '/about' do
	erb :about
end

get '/menu' do
	@products = Product.order 'title'
	erb :menu
end

get '/product/:id' do
	@product = Product.find(params[:id])
	erb :product
end

post '/cart' do

	#Получаем список корзины и разбираем (parse) его
	@orders_input = params[:orders_input]
	@items = parse_orders_input @orders_input

	#Выводим сообщение о том, что корзина пуста

	if @items.length == 0
		return erb :cart_is_empty
	end

	#Выводим список продуктов в корзине

	@items.each do |item|
		#id, cnt
		item[0] = Product.find(item[0])
	end

	#Возвращаем представление по умолчанию
	erb :cart

end

post '/place_order' do

	@order = Order.new params[:order]
	
	if @order.save
		erb :order_placed
	else
		@error = @order.errors.full_messages.first
		erb :index
	end

end

def parse_orders_input orders_input

	s1 = orders_input.split(/,/)

	arr = []

	s1.each do |x|

		s2 = x.strip
		
		if !s2.empty?
	  		s2 = x.split(/=/)
	  		s3 = s2[0].split(/_/)
		
	 		id = s3[1]
	  		cnt = s2[1]

			arr2 = [id, cnt]

	  		arr.push arr2
  		end
	end

	return arr	
end
