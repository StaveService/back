module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :music, Types::MusicType, null: false do
      argument :id, Int, required: true
    end
    field :musics, Types::MusicsType, null: true do
      argument :page, Int, required: false
    end
    field :artist, Types::ArtistType, null: false do
      argument :id, Int, required: true
    end
    field :artists, Types::ArtistsType, null: false do
      argument :page, Int, required: false
    end
    field :band, Types::BandType, null: false do
      argument :id, Int, required: true
    end
    field :bands, Types::BandsType, null: false do
      argument :page, Int, required: false
    end
    field :users, Types::UsersType, null: false do
      argument :page, Int, required: false
    end
    def music(**args)
      Music.find(args[:id])
    end
    def musics(**args)
      musics = Music.page(args[:page]).per(10)
      { data: musics, pagination: pagination(musics) }
    end
    def albums(**args)
      albums= Album.page(args[:page]).per(10)
      { data: albums, pagination: pagination(albums) }
    end
    def artist(**args)
      Artist.find(args[:id])
    end
    def artists(**args)
      artists= Artist.page(args[:page]).per(10)
      { data: artists, pagination: pagination(artists) }
    end
    def band(**args)
      Band.find(args[:id])
    end
    def bands(**args)
      bands = Band.page(args[:page]).per(10)
      { data: bands, pagination: pagination(bands) }
    end
    def users(**args)
      users = User.page(args[:page]).per(10)
      { data: users, pagination: pagination(users) }
    end
    def pagination(result)
      {
        total_count: result.total_count,
        limit_value: result.limit_value,
        total_pages: result.total_pages,
        current_page: result.current_page
      }
    end
  end
end
