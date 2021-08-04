module Types
  class MusicType < Types::BaseObject
    include Helpers
    field :id, ID, null: false
    field :title, String, null: false do
      argument :locale, String, required: true
    end
    field :user, Types::UserType, null: false
    field :link, Types::MusicLinkType, null: false
    field :band, Types::BandType, null: true
    field :composers, [Types::ArtistType], null: true
    field :lyrists, [Types::ArtistType], null: true
    field :artist_musics, [Types::ArtistMusicType], null: true
    field :albums, [Types::AlbumType], null: true
    field :bookmarks, [Types::MusicBookmarkType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :bookmarks_count, Int, null: true
    field :bookmark, Types::MusicBookmarkType, null: true do
      argument :current_user_id, Int, required: false
    end
    field :score, String, null: true
    field :score_exist, Boolean, null: false
    field :root_tree, [Types::TreeType], null: true
    field :tree, [Types::TreeType], null: true do
      argument :oid, String, required: true
    end
    field :blob, String, null: true do
      argument :oid, String, required: true
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

    def bookmark(current_user_id: nil)
      bookmark_current_user(object.music_bookmarks, current_user_id)
    end

    def score
      repo = repository
      revision = repo.last_commit.oid
      blob = repo.blob_at(revision, 'index.tex')
      blob.text
    end

    def score_exist
      score
      true
    rescue StandardError
      false
    end

    def root_tree
      repo = repository
      unless repo.head_unborn?
        ref = repo.head
        commit = ref.target
        commit.tree
      end
    end

    def tree(oid:)
      repo = repository
      tree = repo.lookup(oid)
    end

    def blob(oid:)
      repo = repository
      blob = repo.lookup(oid)
      blob.text
    end

    def repository
      Rugged::Repository.new(repository_path)
    end

    def repository_path
      Rails.root.join('repositories', object.user.id.to_s, "#{object.title}.git")
    end

    def link
      Loaders::AssociationLoader.for(Music, :link).load(object)
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

    def string_translations
      Loaders::AssociationLoader.for(Music, :string_translations).load(object)
    end
  end
end
