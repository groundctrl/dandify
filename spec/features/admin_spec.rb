require 'spec_helper'

feature 'Stylesheet administration' do
  stub_authorization!

  let(:show_path) { spree.admin_stylesheet_path }

  scenario 'user views page with no stylesheet' do
    visit show_path
    expect(page).to have_text 'No custom style yet!'
    expect(page).to_not have_text 'Revision history'
  end

  scenario 'user views page with existing stylesheet' do
    style = create :stylesheet
    visit show_path

    expect(page).to have_text style.style_raw
    expect(page).to_not have_text 'Revision history'
  end

  scenario 'user views page with stylesheet history' do
    new_styles = 'body {display: none;}'
    create(:stylesheet).update_attributes style_raw: new_styles
    visit show_path

    expect(page).to have_text new_styles
    expect(page).to have_content 'Revision history'
  end
end
