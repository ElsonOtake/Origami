class CreateIcons < ActiveRecord::Migration[7.0]
  def change
    create_table :icons do |t|
      t.string :name
      t.binary :image

      t.timestamps
    end
  end
end
