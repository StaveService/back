module Types
  class BandType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :itunes_artist_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :musics, [Types::MusicType], null: true
    field :artists, [Types::ArtistType], null: true
    field :bookmark, Types::BandBookmarkType, null: true do
      argument :current_user_id, Int, required: true
    end
    def bookmark(**args)
      object.band_bookmarks.find_by(user_id: args[:current_user_id])
    end
  end
end
