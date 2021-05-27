module Types
  class BandsType < Types::BaseObject
    field :pagination, Types::PaginationType, null: true
    field :data, [Types::BandType], null: true
  end
end
