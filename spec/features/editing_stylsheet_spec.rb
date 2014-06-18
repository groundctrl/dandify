require 'spec_helper'

feature 'Managing stylesheets' do
  stub_authorization!

  let(:show_path) { spree.admin_stylesheet_path }
  let(:edit_path) { spree.edit_admin_stylesheet_path }

  context 'without existing style' do
    scenario 'user can navigate to edit screen' do
      visit show_path
      click_link 'Create style'
      expect(page).to have_text 'Creating Custom Styles'
    end
  end

  context 'with existing style' do
  end
end
