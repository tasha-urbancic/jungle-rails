require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it('should not be invalid with all four fields') do
      category = Category.create!(name: 'shirts')
      product = Product.create!(name: 'name', price: 99.99, quantity: 3, category: category)

      expect(product).to be_valid
    end

    it('should be invalid without a name') do
      category = Category.new
      category.name = 'shirts'

      product = Product.new 
      product.price = 99.99 
      product.quantity = 3 
      product.category = category

      expect(product).to_not be_valid
      expect(product.errors.messages[:name]).to include('can\'t be blank')
    end

    it('should be invalid without a category') do
      product = Product.new
      product.name = 'name'
      product.price = 99.99 
      product.quantity = 3 

      expect(product).to_not be_valid
      expect(product.errors.messages[:category]).to include('can\'t be blank')
    end

    it('should be invalid without a price') do
      category = Category.new
      category.name = 'shirts'

      product = Product.new 
      product.name = 'name'
      product.quantity = 3 
      product.category = category

      expect(product).to_not be_valid
      expect(product.errors.messages[:price]).to include('can\'t be blank')
    end

    it('should be invalid without a quantity') do
      category = Category.new
      category.name = 'shirts'

      product = Product.new 
      product.name = 'name'
      product.price = 99.99 
      product.category = category

      expect(product).to_not be_valid
      expect(product.errors.messages[:quantity]).to include('can\'t be blank')
    end

  end
end