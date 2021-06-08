module Types
  class BandLinkType < Types::BaseObject
    field :id, ID, null: false
    field :band_id, Integer, null: true
    field :itunes, String, null: true
    field :twitter, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
