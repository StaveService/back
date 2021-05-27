module Types
  class UserType < Types::BaseObject
    include Helpers
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
    field :bookmarked_musics, Types::MusicsType, null: true do
      argument :bookmarked_music_page, Int, required: true
    end
    field :bookmarked_bands, Types::BandsType, null: true do
      argument :bookmarked_band_page, Int, required: true
    end
    field :bookmarked_artists, Types::ArtistsType, null: true do
      argument :bookmarked_artist_page, Int, required: true
    end
    def musics(music_page:)
      index(object.musics, music_page)
    end

    def bookmarked_musics(bookmarked_music_page:)
      index(object.bookmarked_musics, bookmarked_music_page)
    end

    def bookmarked_bands(bookmarked_band_page:)
      index(object.bookmarked_bands, bookmarked_band_page)
    end

    def bookmarked_artists(bookmarked_artist_page:)
      index(object.bookmarked_artists, bookmarked_artists_page)
    end
  end
end
