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
    def musics(**args)
      musics = Music.page(args[:page]).per(10)
      { musics: musics, pagination: pagination(musics) }
    end
    def pagination(result)
      {
        total_count: result.total_count,
        limit_value: result.limit_value,
        total_pages: result.total_pages,
        current_page: result.current_page
      }
    end
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
