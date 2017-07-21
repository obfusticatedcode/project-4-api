class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :feature

  has_and_belongs_to_many :loves, class_name: "User", join_table: "comments_users"
end

#The model relationships
# Comment belongs_to User
# Comment belongs_to Feature
# Comment has_many_belongs_to_many Users ( loves )
