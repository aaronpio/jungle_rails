require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    @category = Category.new(name: "toys")
    @product = Product.new(name: "pogostick", price_cents: 1000, quantity: 100, category: @category)

    puts @category.name
    puts @product.name
    #validates :name, presence: true
    it 'should have a name'
    #validates :price, presence: true
    #validates :quantity, presence: true
    #validates :category, presence: true

  end
    
  # validation tests/examples here
end
  




# it 'should not exist for new records' do
#   @widget = Widget.new
#   expect(@widget.id).to be_nil
# end

# it 'should be auto-assigned by AR for saved records' do
#   @widget = Widget.new
#   # we use bang here b/c we want our spec to fail if save fails (due to validations)
#   # we are not testing for successful save so we have to assume it will be successful
#   @widget.save!

#   expect(@widget.id).to be_present
# end