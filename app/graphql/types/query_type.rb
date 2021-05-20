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
    def music id:
      Music.find id
    end
    def musics page:, q:nil
      musics = Music.ransack(q).result.page(page).per(10)
      { data: musics, pagination: pagination(musics) }
    end
    def album id:
      Album.find id
    end
    def albums page:, q:nil
      albums = Album.ransack(q).result.page(page).per(10)
      { data: albums, pagination: pagination(albums) }
    end
    def artist id:
      Artist.find id
    end
    def artists page:, q:nil
      artists = Artist.ransack(q).result.page(page).per(10)
      { data: artists, pagination: pagination(artists) }
    end
    def band id:
      Band.find id
    end
    def bands page:, q:nil
      bands = Band.ransack(q).result.page(page).per(10)
      { data: bands, pagination: pagination(bands) }
    end
    def user id:
      User.find id
    end
    def users page:, q:nil
      users = User.ransack(q).result.page(page).per(10)
      { data: users, pagination: pagination(users) }
    end
    def issues music_id:, page:, q:nil
      issues = Music.find(music_id).issues.ransack(q).result.page(page).per(10)
      { data: issues, pagination: pagination(issues) }
    end
    def pagination result
      { total_pages: result.total_pages }
    end
  end
end
