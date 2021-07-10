module Types
  class TreeType < Types::BaseObject
    field :name, String, null: false
    field :oid, String, null: false
    field :filemode, String, null: false
    field :type, String, null: false
  end
end
