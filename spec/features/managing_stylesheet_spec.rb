require 'spec_helper'

feature 'Managing stylesheets' do
  stub_authorization!

  let(:show_path)    { spree.admin_stylesheets_path }
  let(:new_path)     { spree.new_admin_stylesheets_path }
  let(:edit_path)    { spree.edit_admin_stylesheets_path }
  let(:restore_path) { spree.restore_admin_stylesheets_path }

  let(:style) { 'body {display: none;}' }

  let(:css_path) { 'table#listing_versions tbody tr' }

  context 'without existing style' do
    scenario 'user views page with no stylesheet' do
      visit show_path
      expect(page).to have_text Spree.t('dandify.admin.no_resource_found')
      expect(page).to have_text Spree.t('dandify.admin.create_one')
    end

    scenario 'user can create styles' do
      visit new_path
      fill_in Spree.t('dandify.admin.labels.style_raw'), with: style
      click_button Spree.t(:create)

      expect(page.status_code).to be(200)
      expect(page).to have_text Spree.t('dandify.admin.title.show')
    end
  end

  context 'with existing style' do
    before { create :stylesheet }

    scenario 'user sees first audit trail', versioning: true do
      visit show_path
      expect(page).to have_css(css_path, count: 1)
    end

    scenario 'user can edit exiting styles' do
      visit edit_path
      fill_in Spree.t('dandify.admin.labels.style_raw'), with: style
      click_button Spree.t(:update)

      expect(page.status_code).to be(200)
      expect(page).to have_text(Spree.t('dandify.admin.title.show'))
    end

    scenario 'user creates new audit trail on edit', versioning: true do
      visit edit_path
      fill_in Spree.t('dandify.admin.labels.style_raw'), with: style
      click_button Spree.t(:update)

      visit show_path
      expect(page).to have_css(css_path, count: 2)
    end
  end

  context 'restoring stylesheet' do
    before { create :stylesheet }

    scenario 'not possible when there is only one version', versioning: true do
      visit show_path
      page.should have_css(css_path, count: 1)
      within_row(1) { expect(page).to have_link('', href: edit_path) }
    end

    scenario 'user can restore to previous version', versioning: true do
      visit edit_path
      fill_in Spree.t('dandify.admin.labels.style_raw'), with: style
      click_button Spree.t(:update)

      visit show_path
      page.should have_css(css_path, count: 2)
      within_row(1) { expect(page).to have_link('', href: edit_path) }
      within_row(2) { expect(page).to have_link('', href: restore_path) }
    end
  end
end