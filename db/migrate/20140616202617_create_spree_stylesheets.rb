class CreateSpreeStylesheets < ActiveRecord::Migration
  def change
    create_table :spree_stylesheets do |t|
      t.text :style_raw
      t.text :style_compressed

      t.timestamps
    end
  end
end
