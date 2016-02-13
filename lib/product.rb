class Product
	attr_reader :title, :price
	attr_accessor :stock
	@@products = []

	def	initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
	end

	def self.all
		@@products
	end

	def self.find_by_title(title)
		@title = title
		@@products.each do |toy|
			if toy.title == @title
				return toy
			end
		end
		raise NoSuchTitleError, "There is no toy with such title"
	end
	def in_stock?
		if @stock == 0
			return false
		else 
			return true
		end
	end
	def self.in_stock
		products_in_stock = []
		@@products.each do |toy|
			if toy.in_stock? == true
				products_in_stock << toy
			end
		end
		products_in_stock
	end

	private

	def add_to_products
		@@products.each do |toy| 
			if toy.title == @title
				raise DuplicateProductError, "That product already exists"
			end
		end
		@@products << self
	end
end
