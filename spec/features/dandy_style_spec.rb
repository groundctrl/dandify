require 'spec_helper'

feature 'Dandy stylesheet' do
  scenario 'store contains dandystylesheet' do
    visit spree.root_path

    expect(page).to(
      have_xpath('//link[contains(@href, "/dandystyles.css")]', visible: false)
    )
  end
end
