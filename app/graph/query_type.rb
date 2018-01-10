QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of this schema'

  connection :releases, ReleaseType.connection_type do
    description 'All Releases of the site so far'

    resolve lambda { |_object, _args, _context|
      ReleaseRepository.search
    }
  end

  connection :posts, PostType.connection_type do
    description 'All content of the site so far'

    resolve lambda { |_object, _args, _context|
      PostRepository.new.search
    }
  end

  connection :days, DayType.connection_type do
    description 'All days of the trip so far'

    resolve lambda { |_object, _args, _context|
      Day.all
    }
  end
end
