module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :provider, String, null: false
    field :uid, String, null: false
    field :encrypted_password, String, null: false
    field :reset_password_token, String, null: true
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    field :allow_password_change, Boolean, null: true
    field :remember_created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :confirmation_token, String, null: true
    field :confirmed_at, GraphQL::Types::ISO8601DateTime, null: true
    field :confirmation_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    field :unconfirmed_email, String, null: true
    field :sign_in_count, Integer, null: false
    field :current_sign_in_at, GraphQL::Types::ISO8601DateTime, null: true
    field :last_sign_in_at, GraphQL::Types::ISO8601DateTime, null: true
    field :current_sign_in_ip, String, null: true
    field :last_sign_in_ip, String, null: true
    field :nickname, String, null: false
    field :image, String, null: true
    field :email, String, null: true
    field :familyname, String, null: false
    field :givenname, String, null: false
    field :introduction, String, null: true
    field :birthday, GraphQL::Types::ISO8601Date, null: true
    field :gender, Integer, null: true
    # field :tokens, Types::JsonType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :musics, Types::MusicsType, null: true do
      argument :music_page, Int, required: true
    end
    field :music_bookmarks, Types::MusicsType, null: true do
      argument :music_bookmark_page, Int, required: true
    end
    def musics(music_page:)
      musics = object.musics.page(music_page).per(10)
      { data: musics, pagination: pagination(musics) }
    end

    def music_bookmarks(music_bookmark_page:)
      music_bookmarks = object.music_bookmarks.page(music_bookmark_page).per(10)
      { data: music_bookmarks, pagination: pagination(music_bookmarks) }
    end

    def pagination(result)
      { total_pages: result.total_pages }
    end
  end
end
