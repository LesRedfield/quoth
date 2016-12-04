require 'rails_helper'

feature "estimate" do
  scenario "has a new quote page" do
    visit new_quote_url
    expect(page).to have_content "Price Estimator"
  end

  feature "pricing an invalid quote" do
    before(:each) do
      visit new_quote_url

      fill_in 'name', :with => "Josh"
      select('male', :from => 'gender')
      fill_in 'city', :with => "Seattle"

      click_on "GET QUOTE"
    end

    scenario "shows age validation error" do
      expect(page).to have_content "Age can't be blank"
    end

    scenario "doesn't show price estimate" do
      expect(page).to_not have_content "policy is estimated"
    end
  end
end
