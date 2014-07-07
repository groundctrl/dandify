require 'spec_helper'

feature 'Viewing stylesheet administration page' do
  stub_authorization!

  let(:show_path) { spree.admin_stylesheets_path }

  scenario 'user views page with no stylesheet' do
    visit show_path
    expect(page).to have_text Spree.t('dandify.show.none')
  end

  scenario 'user views page with new stylesheet' do
    create :stylesheet
    visit show_path
    expect(page).to_not have_text Spree.t('dandify.show.history')
  end

  scenario 'user views page with existing stylesheet' do
    style = create :stylesheet
    visit show_path

    expect(page).to have_text style.style_raw
    expect(page).to_not have_text Spree.t('dandify.show.history')
  end

  scenario 'user views page with stylesheet history', versioning: true do
    create(:stylesheet).update style_raw: 'body {display: none;}'
    visit show_path

    expect(page).to have_text Spree.t('dandify.show.history')
  end
end
