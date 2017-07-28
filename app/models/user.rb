class User < ApplicationRecord
  #This tells Rails that the image property is more than just a string, but should be treated as a file that is stored on AWS.
  mount_uploader :image, ImageUploader

  acts_as_voter

  has_many :products_created, class_name: "Product", foreign_key: "user_id"
  has_many :features
  has_many :comments

  has_and_belongs_to_many :loves_products, class_name: "Product", join_table: "products_users"
  has_and_belongs_to_many :loves_comments, class_name: "Comment", join_table: "comments_users"

  # validations
  has_secure_password validations: false
  validates :username, presence: true, unless: :oauth_login?
  validates :email, presence: true, uniqueness: true, unless: :oauth_login?
  validates :password, presence: true, confirmation: true, unless: :oauth_login?

  def oauth_login?
    github_id.present? || facebook_id.present? || instagram_id.present?
  end


end


# The model relationships
# User has_many Products ( creates )
# User has_many Features ( creates )
# User has_many Comments ( comments )
