restaurant_menu = {"Ramen" => 3, "Dal Makhani" => 4, "Coffee" => 2}
restaurant_menu.each do |item, price|
  puts "#{item}: $#{price}"
end
restaurant_menu