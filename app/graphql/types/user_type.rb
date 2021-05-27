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
      musics = object.musics.page(music_page).per(10)
      { data: musics, pagination: pagination(musics) }
    end

    def bookmarked_musics(bookmarked_music_page:)
      bookmarked_musics = object.bookmarked_musics.page(bookmarked_music_page).per(10)
      { data: bookmarked_musics, pagination: pagination(bookmarked_musics) }
    end

    def bookmarked_bands(bookmarked_band_page:)
      bookmarked_bands = object.bookmarked_bands.page(bookmarked_band_page).per(10)
      { data: bookmarked_bands, pagination: pagination(bookmarked_bands) }
    end

    def bookmarked_artists(bookmarked_artist_page:)
      bookmarked_artists = object.bookmarked_artists.page(bookmarked_artist_page).per(10)
      { data: bookmarked_artists, pagination: pagination(bookmarked_artists) }
    end

    def pagination(result)
      { total_pages: result.total_pages }
    end
  end
end
