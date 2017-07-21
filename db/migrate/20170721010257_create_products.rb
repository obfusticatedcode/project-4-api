class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :image
      t.integer :view_count
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
