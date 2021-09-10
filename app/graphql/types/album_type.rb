module Types
  class AlbumType < Types::BaseObject
    include Helpers
    field :id, ID, null: false
    field :title, String, null: false do
      argument :locale, String, required: true
    end
    field :link, Types::AlbumLinkType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :artists, [Types::ArtistType], null: true
    field :musics, Types::MusicsType, null: true do
      argument :music_page, Int, required: true
    end
    field :bookmarks_count, Int, null: true
    field :bookmark, Types::ArtistBookmarkType, null: true do
      argument :current_user_id, Int, required: false
    end
    field :localed, Boolean, null: false do
      argument :locale, String, required: true
    end

    def title(locale:)
      Mobility.with_locale(locale) do
        object.title
      end
    end

    def localed(locale:)
      object.title(locale: locale).nil?
    end

    def musics(music_page:)
      index(object.musics, music_page)
    end

    def bookmark(current_user_id: nil)
      bookmark_current_user(object.album_bookmarks, current_user_id)
    end

    def link
      Loaders::AssociationLoader.for(Album, :link).load(object)
    end

    def string_translations
      Loaders::AssociationLoader.for(Album, :string_translations).load(object)
    end
  end
end
