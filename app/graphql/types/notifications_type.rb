module Types
  class NotificationsType < Types::BaseObject
    field :pagination, Types::PaginationType, null: true
    field :data, [Types::NotificationType], null: true
  end
end
