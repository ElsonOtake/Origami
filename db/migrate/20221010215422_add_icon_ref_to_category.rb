class AddIconRefToCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :icon, null: false, foreign_key: true
  end
end
