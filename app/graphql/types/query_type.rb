module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :musics, Types::MusicsType, null: true do
      argument :page, Int, required: false
    end
    field :music, Types::MusicType, null: false do
      argument :id, Int, required: true
    end
    field :artists, Types::ArtistsType, null: false do
      argument :page, Int, required: false
    end

    def artist(**args)
      Artist.find(args[:id])
    end
    def artists(**args)
      artists= Artist.page(args[:page]).per(10)
      { data: artists, pagination: pagination(artists) }
    end
    def music(**args)
      Music.find(args[:id])
    end
    def musics(**args)
      musics = Music.page(args[:page]).per(10)
      { data: musics, pagination: pagination(musics) }
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
