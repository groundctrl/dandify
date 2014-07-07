require 'spec_helper'

feature 'Managing stylesheets' do
  stub_authorization!

  let(:show_path) { spree.admin_stylesheets_path }
  let(:new_path) { spree.new_admin_stylesheets_path }
  let(:edit_path) { spree.edit_admin_stylesheets_path }
  let(:style) { 'body {display: none;}' }

  context 'without existing style' do
    scenario 'user can create styles' do
      visit new_path
      fill_in Spree.t('dandify.form.label'), with: style
      click_button Spree.t(:create)

      expect(page.status_code).to be(200)
      expect(page).to have_text Spree.t('dandify.show.title')
    end
  end

  context 'with existing style' do
    before { create :stylesheet }

    scenario 'user sees first audit trail', versioning: true do
      visit show_path

      within_row(1) { expect(page).to have_content('Create') }
    end

    scenario 'user can edit exiting styles' do
      visit edit_path

      fill_in Spree.t('dandify.form.label'), with: style
      click_button Spree.t(:update)

      expect(page.status_code).to be(200)
      expect(page).to have_text(Spree.t('dandify.show.title'))
    end

    scenario 'user creates new audit trail on edit', versioning: true do
      visit edit_path

      fill_in Spree.t('dandify.form.label'), with: style
      click_button Spree.t(:update)

      visit show_path

      within_row(1) { page.should have_content('Update') }
      within_row(2) { page.should have_content('Create') }
    end
  end
end
