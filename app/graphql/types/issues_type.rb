module Types
  class IssuesType < Types::BaseObject
    field :pagination, Types::PaginationType, null: true
    field :data, [Types::IssueType], null: true
  end
end
