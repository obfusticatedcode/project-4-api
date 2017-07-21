class CommentSerializer < ActiveModel::Serializer
  belongs_to :feature
  belongs_to :user

  attributes :id, :title, :description
end

#The model relationships
# Comment belongs_to User
# Comment belongs_to Feature
# Comment has_and_belongs_to_many Users ( loves )
