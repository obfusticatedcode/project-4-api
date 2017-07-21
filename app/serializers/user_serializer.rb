class UserSerializer < ActiveModel::Serializer
  has_many :loves_products
  has_many :loves_comments
  
  attributes :id, :username, :firstname, :lastname, :email, :image
end

# The model relationships
# User has_many Products ( creates )
# User has_many Features ( creates )
# User has_many Comments ( comments )
