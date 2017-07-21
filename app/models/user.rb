class User < ApplicationRecord
  has_many :products
  has_many :features
  has_many :comments
end


# The model relationships

# User has_many Products ( creates )
# User has_many Features ( creates )
# User has_many Comments ( comments )
#
# Product belongs_to User
# Product has_many Features
# Product has_and_belongs_to_many Users ( loves )
#

#
# Comment belongs_to User
# Comment belongs_to Feature
# Comment has_many_belongs_to_many Users ( loves )
