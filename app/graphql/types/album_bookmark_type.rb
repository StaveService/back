module Types
  class AlbumBookmarkType < Types::BaseObject
    field :id, ID, null: false
    field :album_id, Integer, null: true
    field :user_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
