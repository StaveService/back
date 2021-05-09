module Types
  class ArtistMusicType < Types::BaseObject
    field :id, ID, null: false
    field :artist, Types::ArtistType, null: true
    field :music, Types::MusicType, null: true
    field :role, Types::RoleEnum, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
