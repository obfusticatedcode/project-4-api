class UserSerializer < ActiveModel::Serializer
  has_many :loves_products
  has_many :loves_comments

  attributes :id, :username, :firstname, :lastname, :email, :image_src , :upvoted_items

  def image_src
    object.image.url
  end

  def upvoted_items
    object.find_up_voted_items
  end


end

# The model relationships
# User has_many Products ( creates )
# User has_many Features ( creates )
# User has_many Comments ( comments )
