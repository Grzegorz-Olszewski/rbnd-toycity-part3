class Transaction
	@@id = 1
	@@transactions = []
	attr_reader :customer, :product, :id
	def initialize (customer,product)
		@customer = customer
		@product = product
		@id = @@id
		add_to_transactions
	end
	def self.all  
		@@transactions
	end
	def self.find(id)
		@@transactions.each do |transaction|
			if transaction.id == id
				return transaction
			end
		end
		raise NoSuchTransactionError, "There is no such a transaction"
	end
	def add_to_transactions
		if @product.stock > 0
			@@transactions << self
			@@id += 1
			@product.stock = @product.stock - 1
		else
			raise OutOfStockError, "#{@product.title} is out of stock"
		end
	end
	


	#def check_if_that_customer_exist
	#	@@customers.each do |customer|	
end	