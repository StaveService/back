class UserRelationship < ApplicationRecord
  belongs_to :followed, class_name: :User, counter_cache: :followers_count
  belongs_to :follower, class_name: :User, counter_cache: :following_count
end
