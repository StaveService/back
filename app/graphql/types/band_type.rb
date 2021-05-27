module Types
  class BandType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :band_link, Types::BandLinkType, null: true
    field :musics, Types::MusicsType, null: true do
      argument :music_page, Int, required: true
    end
    field :albums, Types::AlbumsType, null: true do
      argument :album_page, Int, required: true
    end
    field :artists, [Types::ArtistType], null: true
    field :bookmark, Types::BandBookmarkType, null: true do
      argument :current_user_id, Int, required: false
    end
    def musics(music_page:)
      musics = object.musics.page(music_page).per(10)
      { data: musics, pagination: pagination(musics) }
    end

    def albums(album_page:)
      albums = object.albums.page(album_page).per(10)
      { data: albums, pagination: pagination(albums) }
    end

    def bookmark(current_user_id: nil)
      object.band_bookmarks.find_by(user_id: current_user_id) if current_user_id
    end

    def pagination(result)
      { total_pages: result.total_pages }
    end
  end
end
