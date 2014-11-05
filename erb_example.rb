require 'erb'
weekday = Time.now.strftime('%A')
simple_temp = "Today is <%= weekday %>"
renderer = ERB.new(simple_temp)
puts output = renderer.result()

x = 42
template = ERB.new "The value of x is: <%= x %>"
puts template.result(binding)

class Listings
	PRODUCT = { :name=> "Bacon Burger",
				:desc => "A 1/3 pound all beef patty cooked to order with applewood smoked bacon, topped with your choice of cheese, plus lettuce, onions, and tomato.",
				:cost => 8.95}
				
	attr_reader :product, :price
	
	def initialize( product="",price="")
		@product = product
		@price = price
	end
	
	def build
		b = binding
		# create and run templates, filling member data variables
		
		ERB.new(<<-'END_PRICE'.gsub(/^\s+/, ""), 0, "", "@price").result b
			<%= PRODUCT[:name] %> -- <%= PRODUCT[:cost] %>
			<%= PRODUCT[:desc] %>
		END_PRICE
	end
end

# setup template data
listings = Listings.new
listings.build

puts listings.product + "\n" + listings.price
		