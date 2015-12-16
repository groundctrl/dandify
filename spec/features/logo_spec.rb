require "spec_helper"

feature "Uploading a frontend logo" do
  stub_authorization!

  let(:good_file_path) { Rails.root + "../../spec/support/assets/dandy.jpg" }
  let(:bad_file_path) { Rails.root + "../../spec/support/assets/dandy.txt" }

  before { create(:store) }

  context "with a valid logo file" do
    it "successfully sets the logo as is" do
      visit spree.edit_admin_general_settings_path

      attach_file("store_logo", good_file_path)
      click_button "Update"

      expect(page)
        .to have_content("General Settings has been successfully updated!")

      visit spree.root_path

      expect(page).to have_css("img[src*='dandy.jpg']")
    end
  end

  context "with an invalid logo file" do
    before { Spree::Config.logo = "logo/spree_50.png" }

    it "rejects non-image files" do
      visit spree.edit_admin_general_settings_path

      attach_file('store_logo', bad_file_path)
      click_button "Update"

      expect(page).to have_content("Logo content type is invalid")

      visit spree.root_path

      expect(page).to have_css("img[src*='logo/spree_50.png']")
    end
  end
end
