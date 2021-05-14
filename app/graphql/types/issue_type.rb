module Types
  class IssueType < Types::BaseObject
    field :id, ID, null: false
    field :music_id, Integer, null: true
    field :user_id, Integer, null: true
    field :title, String, null: true
    field :description, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
