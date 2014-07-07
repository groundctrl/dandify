require 'spec_helper'

feature 'Managing stylesheets' do
  stub_authorization!

  let(:show_path) { spree.admin_stylesheets_path }
  let(:new_path) { spree.new_admin_stylesheets_path }
  let(:edit_path) { spree.edit_admin_stylesheets_path }

  context 'without existing style' do
    scenario 'user can navigate to edit screen' do
      visit show_path
      click_link Spree.t('dandify.show.button.new')

      expect(page).to have_text Spree.t('dandify.new.title')
    end

    scenario 'user can create styles' do
      visit new_path
      fill_in 'Styles', with: 'body {display: none;}'
      click_button 'Create'

      expect(page).to have_text 'body {display: none;}'
    end
  end

  context 'with existing style' do
    before { create :stylesheet }

    scenario 'user can edit exiting styles' do
      visit show_path
      click_link Spree.t('dandify.show.button.edit')

      expect(page).to have_text Spree.t('dandify.edit.title')
      expect(page).to have_text Spree::Stylesheet.first.style_raw
    end

    scenario 'user creates audit trail on edit', versioning: true do
      visit edit_path
      fill_in Spree.t('dandify.form.label'), with: '#main {display: none;}'
      click_button 'Update'

      expect(page).to have_text Spree.t('dandify.show.history')
    end
  end
end
