require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Clicks add to cart and increase number to (1)" do
    # ACT
    visit root_path

    expect(page).to have_css 'article.product', count: 1

    sleep(2)
    click_button 'Add'
    sleep(1)

    save_screenshot "cart-num.jpg"

    within 'nav' do 

      expect(page).to have_text(' (1)')

    end

  end
end