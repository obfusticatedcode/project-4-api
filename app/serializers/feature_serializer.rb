class FeatureSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :product
  has_many :comments

  attributes :id, :title, :description, :image, :user_id, :product_id, :upvotes, :downvotes

  def image_src
    object.image.url
  end

  def upvotes
    object.get_upvotes.size
  end

  def downvotes
    object.get_downvotes.size
  end

end

=begin
# Feature belongs_to User
# Feature belongs_to Product
# Feature has_many Comments
# Feature has_many_belongs_to_many Users ( up-votes )
using a gem called, acts_as_votable which gives the API for voting and down voting...
=end
