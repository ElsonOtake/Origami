class RenameNameOnDeal < ActiveRecord::Migration[7.0]
  def change
    rename_column :deals, :customer_id, :author_id
  end
end
