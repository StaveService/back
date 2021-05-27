module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    include Helpers

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :music, Types::MusicType, null: false do
      argument :id, Int, required: true
    end
    field :musics, Types::MusicsType, null: true do
      argument :page, Int, required: true
      argument :q, GraphQL::Types::JSON, required: false
    end
    field :artist, Types::ArtistType, null: false do
      argument :id, Int, required: true
    end
    field :artists, Types::ArtistsType, null: false do
      argument :page, Int, required: true
      argument :q, GraphQL::Types::JSON, required: false
    end
    field :album, Types::AlbumType, null: false do
      argument :id, Int, required: true
    end
    field :albums, Types::AlbumsType, null: false do
      argument :page, Int, required: true
      argument :q, GraphQL::Types::JSON, required: false
    end
    field :band, Types::BandType, null: false do
      argument :id, Int, required: true
    end
    field :bands, Types::BandsType, null: false do
      argument :page, Int, required: true
      argument :q, GraphQL::Types::JSON, required: false
    end
    field :user, Types::UserType, null: false do
      argument :id, Int, required: true
    end
    field :users, Types::UsersType, null: false do
      argument :page, Int, required: true
      argument :q, GraphQL::Types::JSON, required: false
    end
    field :issues, Types::IssuesType, null: false do
      argument :page, Int, required: true
      argument :music_id, Int, required: true
      argument :q, GraphQL::Types::JSON, required: false
    end
    def music(id:)
      Music.find id
    end

    def musics(page:, q: nil)
      search(Music, page, q)
    end

    def album(id:)
      Album.find id
    end

    def albums(page:, q: nil)
      search(Album, page, q)
    end

    def artist(id:)
      Artist.find id
    end

    def artists(page:, q: nil)
      search(Artist, page, q)
    end

    def band(id:)
      Band.find id
    end

    def bands(page:, q: nil)
      search(Band, page, q)
    end

    def user(id:)
      User.find id
    end

    def users(page:, q: nil)
      search(User, page, q)
    end

    def issues(music_id:, page:, q: nil)
      search(Music.find(music_id).issues, page, q)
    end

  end
end
