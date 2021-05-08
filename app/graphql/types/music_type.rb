module Types
  class MusicType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: true
    field :band_id, Integer, null: true
    field :title, String, null: false
    field :tab, String, null: false
    field :itunes_track_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
