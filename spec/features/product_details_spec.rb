require 'rails_helper'

RSpec.feature "Visitor navigates to product details page from home page", type: :feature, js: true do
  
  # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see clicked product's details" do
    # ACT
    visit root_path
    first('article.product').find_link('Detail').click
    save_screenshot
    expect(page).to have_css 'section.products-show'
  end

end
