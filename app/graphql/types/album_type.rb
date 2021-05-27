module Types
  class AlbumType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :album_link, Types::AlbumLinkType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :musics, Types::MusicsType, null: true do
      argument :music_page, Int, required: true
    end
    def musics(music_page:)
      musics = object.musics.page(music_page).per(10)
      { data: musics, pagination: pagination(musics) }
    end

    def pagination(result)
      { total_pages: result.total_pages }
    end
  end
end
