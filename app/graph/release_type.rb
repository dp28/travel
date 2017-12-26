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
end
