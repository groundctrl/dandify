require 'spec_helper'

describe 'When on main configuration page' do
  stub_authorization!

  let(:configuration_path) { spree.edit_admin_general_settings_path }
  let(:show_path) { spree.admin_stylesheet_path }

  it 'the user views Dandify link in sidebar' do
    visit configuration_path
    expect(page).to have_link(Spree.t('dandify.sidebar'), :href => show_path)
  end
end
