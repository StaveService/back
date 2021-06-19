module Types
  class MusicLinkType < Types::BaseObject
    field :id, ID, null: false
    field :itunes, Integer, null: true
    field :musixmatch, String, null: true
    field :spotify, String, null: true
    field :music, Types::MusicType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
