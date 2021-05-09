module Types
  class MusicType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :tab, String, null: false
    field :itunes_track_id, Integer, null: true
    field :user, Types::UserType, null: true
    field :music_link, Types::MusicLinkType, null: true
    field :band, Types::BandType, null: true
    field :composers, [Types::ArtistType], null: true 
    field :lyrists, [Types::ArtistType], null: true
    field :artist_musics, [Types::ArtistMusicType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
