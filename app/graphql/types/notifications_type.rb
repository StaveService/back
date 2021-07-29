module Types
  class NotificationsType < Types::BaseObject
    field :pagination, Types::PaginationType, null: true
    field :data, [Types::NotificationType], null: true
    field :notification_exist, Boolean, null: true
    def notification_exist
      object[:data].unread.present?
    end
  end
end
