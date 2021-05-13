module Types
  class ArtistBookmarkType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: true
    field :artist_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
