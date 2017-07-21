class User < ApplicationRecord
  has_many :products_created, class_name: "Product", foreign_key: "user_id"
  has_many :features
  has_many :comments

  has_and_belongs_to_many :loves_products, class_name: "Product", join_table: "products_users"
  has_and_belongs_to_many :loves_comments, class_name: "Comment", join_table: "comments_users"

end


# The model relationships
# User has_many Products ( creates )
# User has_many Features ( creates )
# User has_many Comments ( comments )
