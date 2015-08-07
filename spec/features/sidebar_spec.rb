require 'spec_helper'

feature 'In the admin sidebar' do
  stub_authorization!

  let(:configuration_path) { spree.edit_admin_general_settings_path }
  let(:show_path)          { spree.admin_stylesheets_path }
  let(:new_path)           { spree.new_admin_stylesheets_path }
  let(:edit_path)          { spree.edit_admin_stylesheets_path }

  context 'on the configuration page' do
    before { visit configuration_path }

    it 'the user views non-highlighted Dandify link in sidebar' do
      expect(page).to_not(
        have_selector(:css, "li.active a[href='#{show_path}']")
      )
      expect(page).to have_link(
        Spree.t('dandify.admin.sidebar'), href: show_path
      )
    end
  end

  context 'the user views highlighted sidebar link' do
    it 'on Dandify show page' do
      visit show_path
      expect(page).to have_selector(:css, "li.active a[href='#{show_path}']")
      expect(page).to have_link(
        Spree.t('dandify.admin.sidebar'), href: show_path
      )
    end

    it 'on Dandify edit page' do
      visit edit_path
      expect(page).to have_selector(:css, "li.active a[href='#{show_path}']")
      expect(page).to have_link(
        Spree.t('dandify.admin.sidebar'), href: show_path
      )
    end

    it 'on Dandify new page' do
      visit new_path
      expect(page).to have_selector(:css, "li.active a[href='#{show_path}']")
      expect(page).to have_link(
        Spree.t('dandify.admin.sidebar'), href: show_path
      )
    end
  end
end
