module Types
  class ArtistType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :artist_link, Types::ArtistLinkType, null: true
    field :bands, Types::BandsType, null: false
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
      musics = object.musics.page(music_page).per(10)
      { data: musics, pagination: pagination(musics) }
    end

    def albums(album_page:)
      albums = object.albums.page(album_page).per(10)
      { data: albums, pagination: pagination(albums) }
    end

    def bookmark(current_user_id: nil)
      object.artist_bookmarks.find_by(user_id: current_user_id) if current_user_id
    end

    def pagination(result)
      { total_pages: result.total_pages }
    end
  end
end
