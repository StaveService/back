module Types
  class ArtistType < Types::BaseObject
    include Helpers
    field :id, ID, null: false
    field :name, String, null: false do
      argument :locale, String, required: true
    end
    field :link, Types::ArtistLinkType, null: false
    field :bands, [Types::BandType], null: false
    field :albums, Types::AlbumsType, null: false do
      argument :album_page, Int, required: true
    end
    field :musics, Types::MusicsType, null: false do
      argument :music_page, Int, required: true
    end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :bookmarks_count, Int, null: true
    field :bookmark, Types::ArtistBookmarkType, null: true do
      argument :current_user_id, Int, required: false
    end
    field :localed, Boolean, null: false do
      argument :locale, String, required: true
    end

    def name(locale:)
      Mobility.with_locale(locale) do
        object.name
      end
    end

    def localed(locale:)
      object.name(locale: locale).nil?
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

    def link
      Loaders::AssociationLoader.for(Artist, :link).load(object)
    end

    def string_translations
      Loaders::AssociationLoader.for(Artist, :string_translations).load(object)
    end
  end
end
