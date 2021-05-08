module Types
  class MusicsType < Types::BaseObject
    field :pagination, Types::PaginationType, null: true
    field :musics, [Types::MusicType], null: true
  end
end