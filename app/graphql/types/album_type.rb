module Types
  class AlbumType < Types::BaseObject
    include Helpers
    field :id, ID, null: false
    field :title, String, null: false
    field :album_link, Types::AlbumLinkType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :artists, [Types::ArtistType], null: true
    field :musics, Types::MusicsType, null: true do
      argument :music_page, Int, required: true
    end
    def musics(music_page:)
      index(object.musics, music_page)
    end
    def album_link
      Loaders::AssociationLoader.for(Album, :album_link).load(object)
    end
  end
end
