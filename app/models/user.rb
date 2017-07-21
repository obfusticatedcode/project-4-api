class User < ApplicationRecord
  has_many :products
  has_many :features
  has_many :comments
end


# The model relationships
# User has_many Products ( creates )
# User has_many Features ( creates )
# User has_many Comments ( comments )
