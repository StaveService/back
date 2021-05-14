module Mutations
  class CreateMusic < BaseMutation
    # define return fields
    field :music, Types::MusicType, null: false

    # define arguments
    argument :title, String, required: true
    argument :tab, String, required: true

    # define resolve method
    def resolve(title:, tab:)
      if current_user 
        music = Music.create(title: title, tab: tab) 
        { music: music }
      end
    end
  end
end
