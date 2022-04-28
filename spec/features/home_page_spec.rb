require 'rails_helper'

RSpec.feature "HomePages", type: :feature do
  scenario "The visitor should see the portfolio home page" do
    visit root_path
    expect(page).to have_text("Alan's Portfolio")
  end
  
end
