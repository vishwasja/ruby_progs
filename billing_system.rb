ITEM_PRICE = { milk: 3.97, bread: 2.17, banana: 0.99, apple: 0.89 }
ITEM_SALE_PRICE = { milk: 2 , bread: 3 }
ITEM_SALE_QUANTITY = { milk: 5.00, bread: 7.00 }

class BillingSystem

	ITEM_PRICE = { milk: 3.97, bread: 2.17, banana: 0.99, apple: 0.89 }

	ITEM_SALE_PRICE = { milk: {2 => 5.00}, bread: {3 => 7.00} }

	attr_reader :order

	def initiliaze items
		@order = order_details items
	end


	def generate_bill
	end

	private

	def order_details items
	end

end

puts "Please enter all the items purchased separated by a comma"
items = gets.chomp


p arr = items.gsub(/\p{Space}/,'').split(',')
p hash = arr.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }
total = 0
hash.each do |item,quantity|
	if ITEM_SALE_PRICE.has_key?(item.to_sym)
		total += (quantity / ITEM_SALE_PRICE[item.to_sym][0]) * ITEM_SALE_PRICE[item.to_sym][1]
		total += ITEM_PRICE[item.to_sym] * ( quantity % ITEM_SALE_PRICE[item.to_sym][0] )
	else
		total += ITEM_PRICE[item.to_sym] * quantity
	end
end
p total


class Item
	attr_reader :name, :price
end



BillingSystem.new( items )