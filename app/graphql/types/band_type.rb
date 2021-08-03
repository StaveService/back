module Types
  class BandType < Types::BaseObject
    include Helpers
    field :id, ID, null: false
    field :name, String, null: true do
      argument :locale, String, required: true
    end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :link, Types::BandLinkType, null: true
    field :musics, Types::MusicsType, null: true do
      argument :music_page, Int, required: true
    end
    field :albums, Types::AlbumsType, null: true do
      argument :album_page, Int, required: true
    end
    field :artists, [Types::ArtistType], null: true
    field :bookmarks_count, Int, null: true
    field :bookmark, Types::BandBookmarkType, null: true do
      argument :current_user_id, Int, required: false
    end

    def name(locale:)
      object.name(locale: locale)
    end

    def musics(music_page:)
      index(object.musics, music_page)
    end

    def albums(album_page:)
      index(object.albums, album_page)
    end

    def bookmark(current_user_id: nil)
      bookmark_current_user(object.band_bookmarks, current_user_id)
    end
  end
end
