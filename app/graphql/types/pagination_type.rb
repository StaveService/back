module Types
  class PaginationType < Types::BaseObject
    field :total_count, Int, null: true
    field :limit_value, Int, null: true
    field :total_pages, Int, null: true
    field :current_page, Int, null: true
  end
end