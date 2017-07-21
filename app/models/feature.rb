class Feature < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :comments

  acts_as_votable

end

=begin
# Feature belongs_to User
# Feature belongs_to Product
# Feature has_many Comments
# Feature has_many_belongs_to_many Users ( up-votes )
use a gem called, acts_as_votable
=end
