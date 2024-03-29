module Types
  class UserRelationshipType < Types::BaseObject
    field :id, ID, null: false
    field :follower_id, Integer, null: true
    field :followed_id, Integer, null: true
    field :follower, Types::UserType, null: true
    field :followed, Types::UserType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
