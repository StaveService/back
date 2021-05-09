module Types
  class ArtistsType < Types::BaseObject
    field :pagination, Types::PaginationType, null: true
    field :data, [Types::ArtistType], null: true
  end
end