module Types
  class AlbumsType < Types::BaseObject
    field :pagination, Types::PaginationType, null: true
    field :data, [Types::AlbumType], null: true
  end
end