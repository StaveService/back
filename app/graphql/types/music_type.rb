module Types
  class MusicType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :tab, String, null: false
    field :user, Types::UserType, null: true
    field :music_link, Types::MusicLinkType, null: true
    field :band, Types::BandType, null: true
    field :composers, [Types::ArtistType], null: true
    field :lyrists, [Types::ArtistType], null: true
    field :artist_musics, [Types::ArtistMusicType], null: true
    field :albums, [Types::AlbumType], null: true
    field :bookmarks, [Types::MusicBookmarkType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :bookmark, Types::MusicBookmarkType, null: true do
      argument :current_user_id, Int, required: false
    end
    def bookmark(current_user_id: nil)
      object.music_bookmarks.find_by(user_id: current_user_id) if current_user_id
    end
  end
end
