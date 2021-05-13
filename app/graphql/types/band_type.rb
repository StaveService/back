module Types
  class BandType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :itunes_artist_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :musics, Types::MusicsType, null: true do
      argument :music_page, Int, required: true
    end
    field :albums, Types::AlbumsType, null: true do
      argument :album_page, Int, required: true
    end
    field :artists, [Types::ArtistType], null: true 
    field :bookmark, Types::BandBookmarkType, null: true do
      argument :current_user_id, Int, required: true
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
      object.band_bookmarks.find_by(user_id: args[:current_user_id])
    end
    def pagination(result)
      { total_pages: result.total_pages }
    end
  end
end
