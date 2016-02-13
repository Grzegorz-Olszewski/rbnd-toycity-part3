class Customer
	attr_reader :name
	@@customers = []
	def initialize (options={})
		@name = options[:name]
		add_to_customers
	end

	def self.find_by_name(name)
		@name = name
		@@customers.each do |customer|
			if customer.name == @name
				return customer
			end
		end
		raise NoSuchNameError, "Customer with such name doesn't exist."
	end

	def purchase(toy)
		Transaction.new(self,toy)
	end
	def self.all 
		@@customers
	end
	private

	def add_to_customers 
		@@customers.each do |customer|
			if customer.name == @name
				raise DuplicateCustomerError, "There is already customer with the same name" 
			end
		end
		@@customers << self
	end
end