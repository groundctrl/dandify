require 'spec_helper'

describe 'Managing stylesheet' do
  stub_authorization!

  let(:show_path) { spree.admin_stylesheets_path }
  let(:new_path)  { spree.new_admin_stylesheets_path }
  let(:edit_path) { spree.edit_admin_stylesheets_path }

  context 'create stylesheet link' do
    it 'is available when there are no stylesheets' do
      visit show_path
      expect(page).to have_link(
        Spree.t('dandify.admin.buttons.new'), href: new_path
      )
    end

    it 'is not available when there are stylesheets' do
      create(:stylesheet)
      visit show_path
      expect(page).to_not have_link(
        Spree.t('dandify.admin.buttons.new'), href: new_path
      )
    end
  end

  context 'edit stylesheet link' do
    it 'is not available when there are stylesheets' do
      visit show_path
      expect(page).to_not have_link(
        Spree.t('dandify.admin.buttons.edit'), href: edit_path
      )
    end

    it 'is available when there are stylesheets' do
      create(:stylesheet)
      visit show_path
      expect(page).to have_link(
        Spree.t('dandify.admin.buttons.edit'), href: edit_path
      )
    end
  end

  context 'back to list of stylesheets button' do
    it 'is available on `new` page' do
      visit new_path
      expect(page).to have_link(
        Spree.t('dandify.admin.buttons.back'), href: show_path
      )
    end

    it 'is available on `edit` page' do
      visit edit_path
      expect(page).to have_link(
        Spree.t('dandify.admin.buttons.back'), href: show_path
      )
    end

    it 'is not available on listing page' do
      visit show_path
      expect(page).to_not have_link(
        Spree.t('dandify.admin.buttons.back'), href: show_path
      )
    end
  end
end
