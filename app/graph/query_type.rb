QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of this schema'

  connection :releases, ReleaseType.connection_type do
    description 'All Releases of the site so far'

    resolve lambda { |_object, _args, _context|
      ReleaseRepository.search
    }
  end
end
