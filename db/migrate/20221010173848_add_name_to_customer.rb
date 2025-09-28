class AddNameToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :name, :string
  end
end
