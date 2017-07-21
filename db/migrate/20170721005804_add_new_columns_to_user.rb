class AddNewColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :github_id, :bigint
    add_column :users, :facebook_id, :bigint
    add_column :users, :instagram_id, :bigint
    add_column :users, :image, :text
  end
end
