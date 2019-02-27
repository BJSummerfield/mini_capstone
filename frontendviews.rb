require 'tty-table'
require 'http'
puts "\e[H\e[2J"
while true
  p "Welcome to the products app"
  p "please choose an option"
  p "1 - Product"
  p "2 - All Products"
  p "q to exit"
  input = gets.chomp
  puts "\e[H\e[2J"
  if input == "1"
    input = "products"
  elsif input == "2"
    input = "all_products"
  elsif input == "q"
    exit
  end
  response = HTTP.get("http://localhost:3000/api/#{input}")
  pro = response.parse
  array =[]
  pro[input].length.times do |i|
    name = pro[input][i]['name']
    description = pro[input][i]['description']
    price = pro[input][i]['price']
    array << ["#{name}","#{description}","#{price}"]
  end
  table = TTY::Table.new ['name','description', 'price'], array
  puts table.render(:ascii)
end
