module Types
  class AlbumType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :album_link, Types::AlbumLinkType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
