module Types
  class MusicBookmarkType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: true
    field :user, Types::UserType, null: true
    field :music, Types::MusicType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
