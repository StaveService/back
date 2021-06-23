module Types
  class AlbumLinkType < Types::BaseObject
    field :id, ID, null: false
    field :itunes, Integer, null: true
    field :spotify, String, null: true
    field :album_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
