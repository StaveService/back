class UserRelationship < ApplicationRecord
  belongs_to :followed, class_name: :User, counter_cache: :followers_count
  belongs_to :follower, class_name: :User, counter_cache: :following_count

  after_create :after_create_user_relationship

  def after_create_user_relationship
    UserRelationshipNotification.with(user_relationship: self).deliver(followed)
  end
end
