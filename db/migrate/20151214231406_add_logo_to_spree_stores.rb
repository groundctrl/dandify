class AddLogoToSpreeStores < ActiveRecord::Migration
  def change
    add_attachment :spree_stores, :logo
  end
end
