require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

#0.1 Дополнить Gemfile описанием зависимостей гемов
#0.2 Запускаем в командной строке bundle install (установка необхожимых гемов)

#1. Подключаем активрекорд 
require 'sinatra/activerecord'

#2. Создаем подключение к бд
set :database, "sqlite3:pazzashop.db"

#3. Создаем модель
class Product < ActiveRecord::Base

end

#4. Создаем Rakefile в папке с app.rb для создания миграции
#(это руби фаил который подключает необходимый неймспейсы)

#5. Запускаем rake команды которые создают базу под нужную версию программы
#rake db:create_migration NAME=name_of_migration - создает фаил новой миграции в db/migrate/
#rake db:migrate - применяет (выполняет) созданную миграцию (грубо говоря в этот момент создаются таблицы в бд и сама бд)
#rake db:rollback - возврат к передыдущей миграции

get '/' do
 	erb :index
end

get '/about' do
	erb :about
end

