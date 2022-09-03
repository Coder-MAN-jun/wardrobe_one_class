# 30-3
require_relative 'lib/clothes_item'

# Прочитать список шмоток из папки /data
files = Dir[File.join(__dir__, 'data/*.txt')]

clothes = files.map { |file| ClothesItem.from_file(file) }

# Спросить у юзера температуру
puts 'Сколько градусов за окном? (можно с минусом'

user_temp =  STDIN.gets.to_i

# Выбрать шмотки подходящие по температуре
suitable_clothes  = clothes.select { |item| item.suitable_for_temperature?(user_temp) }

# Выбрать по одной шмотке каждого типа
# определить список типов
types = suitable_clothes.map(&:type).uniq

clothes_for_user = 
	types.map do |type|
		suitable_clothes.select { |item| item.type == type }.sample
	end

puts 'Предлагаем сегодня надеть:'

clothes_for_user.each do |item|
	puts item
end
