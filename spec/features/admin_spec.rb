require 'spec_helper'

feature 'Stylesheet Admin' do
  stub_authorization!

  given!(:stylesheet) { create(:stylesheet) }

  context 'show' do
    background do
      visit spree.admin_stylesheet_path
    end

    scenario 'shows style' do
      expect(page).to have_text stylesheet.style_raw
    end
  end
end
