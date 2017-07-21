class CreateJoinTableUsersFeatures < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :features do |t|
      # t.index [:user_id, :feature_id]
      # t.index [:feature_id, :user_id]
    end
  end
end
