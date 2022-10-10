class CreateIcons < ActiveRecord::Migration[7.0]
  def change
    create_table :icons do |t|
      t.string :name
      t.string :file_name
      t.string :alt_text

      t.timestamps
    end
  end
end
