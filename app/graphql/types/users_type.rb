module Types
  class UsersType < Types::BaseObject
    field :pagination, Types::PaginationType, null: true
    field :data, [Types::UserType], null: true
  end
end
