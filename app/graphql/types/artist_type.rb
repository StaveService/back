module Types
  class ArtistType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :itunes_artist_id, Integer, null: true
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
    def musics(**args)
      musics = object.musics.page(args[:music_page]).per(10)
      { data: musics, pagination: pagination(musics) }
    end
    def albums(**args)
      albums= object.albums.page(args[:album_page]).per(10)
      { data: albums, pagination: pagination(albums) }
    end
    def bookmark(**args)
      object.artist_bookmarks.find_by(user_id: args[:current_user_id]) if args[:current_user_id]
    end
    def pagination(result)
      { total_pages: result.total_pages }
    end
  end
end
