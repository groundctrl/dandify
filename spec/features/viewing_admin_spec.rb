require 'spec_helper'

feature 'Viewing stylesheet administration page' do
  stub_authorization!

  let(:show_path) { spree.admin_stylesheets_path }

  context 'without existing style' do
    scenario 'user views page with no stylesheet' do
      visit show_path

      expect(page).to have_text Spree.t('dandify.admin.none')
    end

    scenario 'user has access to create link' do
      visit show_path

      expect(page).to have_text Spree.t('dandify.admin.buttons.new')
    end

    scenario 'user does not have access to edit link' do
      visit show_path

      expect(page).to_not have_text Spree.t('dandify.admin.buttons.edit')
    end
  end

  context 'with existing style' do
    before { create :stylesheet }

    scenario 'user views page with an active stylesheet' do
      visit show_path

      expect(page).to_not have_text Spree.t('dandify.admin.none')
    end

    scenario 'user does not have access to create link' do
      visit show_path

      expect(page).to_not have_text Spree.t('dandify.admin.buttons.new')
    end

    scenario 'user has access to edit link' do
      visit show_path

      expect(page).to have_text Spree.t('dandify.admin.buttons.edit')
    end
  end
end
