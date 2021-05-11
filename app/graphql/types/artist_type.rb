module Types
  class ArtistType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :itunes_artist_id, Integer, null: true
    field :bands, Types::BandsType, null: false
    field :albums, Types::AlbumType, null: false
    field :musics, Types::MusicType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
