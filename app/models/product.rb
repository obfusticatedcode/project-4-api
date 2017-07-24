class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :features

  has_and_belongs_to_many :loved_by, class_name: "User", join_table: "products_users"

end

#The model relationships
# Product belongs_to User
# Product has_many Features
# Product has_and_belongs_to_many Users ( loves )
