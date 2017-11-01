require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

#0.1 Дополнить Gemfile описанием зависимостей гемов
#0.2 Запускаем в командной строке bundle install (установка необхожимых гемов)

#1. Подключаем активрекорд 
require 'sinatra/activerecord'

#2. Создаем подключение к бд
set :database, "sqlite3:pizzashop.db"

#3. Создаем модель
class Product < ActiveRecord::Base

end

#4. Создаем Rakefile в папке с app.rb для создания миграции
#(это руби фаил который подключает необходимый неймспейсы)

#5. Запускаем rake команды которые создают базу под нужную версию программы

#5.1 rake db:create_migration NAME=create_products - создает фаил новой миграции для продуктов  в db/migrate/
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
