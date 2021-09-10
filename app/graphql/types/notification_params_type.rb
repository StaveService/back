module Types
  class NotificationParamsType < Types::BaseObject
    field :user_relationship, Types::UserRelationshipType, null: true
    field :music_bookmark, Types::MusicBookmarkType, null: true
  end
end
