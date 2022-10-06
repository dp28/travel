ReleaseLinksType = GraphQL::ObjectType.define do
  name 'ReleaseLinks'
  field :javascript, types.String
  field :css, types.String
end

ReleaseType = GraphQL::ObjectType.define do
  name 'Release'
  description 'A release of the site'

  implements GraphQL::Relay::Node.interface

  field :id do
    type !types.ID
    resolve lambda { |release, _, _|
      GraphQL::Schema::UniqueWithinType.encode('Release', release.version)
    }
  end

  field :version, types.String
  field :description, types.String
  field :time, types.String

  field :links do
    type ReleaseLinksType

    resolve ->(release, _, _) { release.links }
  end
end
