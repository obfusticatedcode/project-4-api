class ProductSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :loved_by
  has_many :features

  attributes :id, :name, :category,:view_count, :user_id, :image_src

  def image_src
    object.image.url
  end
end

#The model relationships
# Product belongs_to User
# Product has_many Features
# Product has_and_belongs_to_many Users ( loves )
