module Types
  class MusicType < Types::BaseObject
    include Helpers
    field :id, ID, null: false
    field :title, String, null: false
    field :tab, String, null: false
    field :user, Types::UserType, null: true
    field :music_link, Types::MusicLinkType, null: true
    field :band, Types::BandType, null: true
    field :composers, [Types::ArtistType], null: true
    field :lyrists, [Types::ArtistType], null: true
    field :artist_musics, [Types::ArtistMusicType], null: true
    field :albums, [Types::AlbumType], null: true
    field :bookmarks, [Types::MusicBookmarkType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :bookmark, Types::MusicBookmarkType, null: true do
      argument :current_user_id, Int, required: false
    end
    def bookmark(current_user_id: nil)
      bookmark_current_user(object.music_bookmarks, current_user_id)
    end

    def music_link
      Loaders::AssociationLoader.for(Music, :music_link).load(object)
    end

    def user
      Loaders::AssociationLoader.for(Music, :user).load(object)
    end

    def band
      Loaders::AssociationLoader.for(Music, :band).load(object)
    end

    def composers
      Loaders::AssociationLoader.for(Music, :composers).load(object)
    end

    def lyrists
      Loaders::AssociationLoader.for(Music, :lyrists).load(object)
    end

    def albums
      Loaders::AssociationLoader.for(Music, :albums).load(object)
    end

    def artist_musics
      Loaders::AssociationLoader.for(Music, :artist_musics).load(object)
    end
  end
end
