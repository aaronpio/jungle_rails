require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    mock_category = Category.new(name: "toys")
    mock_product = Product.new(name: "pogostick", price_cents: 1000, quantity: 100, category: mock_category)

    
    it 'should be good if we give it what it wants' do
      expect(mock_product).to be_valid
      mock_product.save
      expect(mock_product.errors.full_messages).to eql([])
    end

    #validates :name, presence: true
    it 'should be given a name' do
    mock_product.name = nil
    mock_product.save
    expect(mock_product.errors.full_messages).to eql(["Name can't be blank"])
    end

    #validates :price, presence: true
    it 'should be given a price' do
      mock_product.price_cents = nil
      mock_product.save
      expect(mock_product.errors.full_messages).to include("Price cents is not a number")
    end

    #validates :quantity, presence: true
    it 'should be given a quantity' do
      mock_product.quantity = nil
      mock_product.save
      expect(mock_product.errors.full_messages).to include("Quantity can't be blank")
    end

    #validates :category, presence: true
    it 'should be given a category' do
      mock_product.category = nil
      mock_product.save
      expect(mock_product.errors.full_messages).to include("Category can't be blank")
    end

  end
    
end