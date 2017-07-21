class ProductSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :loved_by

  attributes :id, :name, :category, :image, :view_count, :user_id
end

#The model relationships
# Product belongs_to User
# Product has_many Features
# Product has_and_belongs_to_many Users ( loves )
