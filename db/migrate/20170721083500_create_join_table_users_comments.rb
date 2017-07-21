class CreateJoinTableUsersComments < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :comments do |t|
      # t.index [:user_id, :comment_id]
      # t.index [:comment_id, :user_id]
    end
  end
end
