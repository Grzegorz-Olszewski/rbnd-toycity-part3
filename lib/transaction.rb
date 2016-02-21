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
	def self.return_item (id_of_transaction)
		transaction = Transaction.find_transaction_by_id(id_of_transaction)
		puts "#{transaction.customer.name} returned #{transaction.product.title}"
		Transaction.find_transaction_by_id(id_of_transaction).product.stock -=1
	end
	def self.all  
		@@transactions
	end
	def self.find_transaction_by_id(id)
		@@transactions.each do |transaction|
			if transaction.id == id
				return transaction
			end
		end
		raise NoTransactionError, "There is no such a transaction"
	end
	def self.find_transaction_by_customer_name(customer_name)
		@@transactions.each do |transaction|
			if transaction.customer.name == customer_name
				return transaction
			end
		end
		raise NoTransactionError, "There is no such a transaction"
	end
	def self.find_transaction_by_product_title(title)
		@@transactions.each do |transaction|
			if transaction.product.title == title
				return transaction
			end
		end
		raise NoTransactionError, "There is no such a transaction"
	end	

	def add_to_transactions
		if @product.stock > 0
			@@transactions << self
			@@id += 1
			@product.stock -=1
		else
			raise OutOfStockError, "'#{@product.title}' is out of stock"
		end
	end
end	