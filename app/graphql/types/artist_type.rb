module Types
  class ArtistType < Types::BaseObject
    include Helpers
    field :id, ID, null: false
    field :name, String, null: false
    field :link, Types::ArtistLinkType, null: true
    field :bands, [Types::BandType], null: false
    field :albums, Types::AlbumsType, null: false do
      argument :album_page, Int, required: true
    end
    field :musics, Types::MusicsType, null: false do
      argument :music_page, Int, required: true
    end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :bookmark, Types::ArtistBookmarkType, null: true do
      argument :current_user_id, Int, required: false
    end
    def musics(music_page:)
      index(object.musics, music_page)
    end

    def albums(album_page:)
      index(object.albums, album_page)
    end

    def bookmark(current_user_id: nil)
      bookmark_current_user(object.artist_bookmarks, current_user_id)
    end
  end
end
