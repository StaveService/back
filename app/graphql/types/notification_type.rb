module Types
  class NotificationType < Types::BaseObject
    field :id, ID, null: false
    field :recipient_type, String, null: true
    field :recipient_id, Integer, null: true
    field :type, String, null: false
    field :params, Types::NotificationParamsType, null: true
    field :read_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
