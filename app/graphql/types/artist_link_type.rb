module Types
  class ArtistLinkType < Types::BaseObject
    field :id, ID, null: false
    field :artist_id, Integer, null: true
    field :twitter, String, null: true
    field :itunes, String, null: true
    field :spotify, String, null: true
    field :wikipedia, String, null: true do
      argument :locale, String, required: true
    end
    field :youtube, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def wikipedia(locale:)
      object.wikipedia(locale: locale)
    end
  end
end
