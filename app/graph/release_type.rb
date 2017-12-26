ReleaseType = GraphQL::ObjectType.define do
  name 'Release'
  description 'A release of the site'

  field :version, types.String
  field :description, types.String
  field :time, types.String
end
